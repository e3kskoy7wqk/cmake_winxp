/* Copyright Joyent, Inc. and other Node contributors. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

#include <assert.h>
#include <limits.h>
#include <stdlib.h>

#if defined(__MINGW64_VERSION_MAJOR)
/* MemoryBarrier expands to __mm_mfence in some cases (x86+sse2), which may
 * require this header in some versions of mingw64. */
#include <intrin.h>
#endif

#include "uv.h"
#include "internal.h"

static void uv__once_inner(uv_once_t* guard, void (*callback)(void)) {
  DWORD result;
  HANDLE existing_event, created_event;

  created_event = CreateEvent(NULL, 1, 0, NULL);
  if (created_event == 0) {
    /* Could fail in a low-memory situation? */
    uv_fatal_error(GetLastError(), "CreateEvent");
  }

  existing_event = InterlockedCompareExchangePointer(&guard->event,
                                                     created_event,
                                                     NULL);

  if (existing_event == NULL) {
    /* We won the race */
    callback();

    result = SetEvent(created_event);
    assert(result);
    guard->ran = 1;

  } else {
    /* We lost the race. Destroy the event we created and wait for the existing
     * one to become signaled. */
    CloseHandle(created_event);
    result = WaitForSingleObject(existing_event, INFINITE);
    assert(result == WAIT_OBJECT_0);
  }
}


void uv_once(uv_once_t* guard, void (*callback)(void)) {
  /* Fast case - avoid WaitForSingleObject. */
  if (guard->ran) {
    return;
  }

  uv__once_inner(guard, callback);
}


/* Verify that uv_thread_t can be stored in a TLS slot. */
STATIC_ASSERT(sizeof(uv_thread_t) <= sizeof(void*));

static uv_key_t uv__current_thread_key;
static uv_once_t uv__current_thread_init_guard = UV_ONCE_INIT;


static void uv__init_current_thread_key(void) {
  if (uv_key_create(&uv__current_thread_key))
    abort();
}


struct thread_ctx {
  void (*entry)(void* arg);
  void* arg;
  uv_thread_t self;
};


static UINT __stdcall uv__thread_start(void* arg) {
  struct thread_ctx *ctx_p;
  struct thread_ctx ctx;

  ctx_p = arg;
  ctx = *ctx_p;
  uv__free(ctx_p);

  uv_once(&uv__current_thread_init_guard, uv__init_current_thread_key);
  uv_key_set(&uv__current_thread_key, ctx.self);

  ctx.entry(ctx.arg);

  return 0;
}


int uv_thread_create(uv_thread_t *tid, void (*entry)(void *arg), void *arg) {
  uv_thread_options_t params;
  params.flags = UV_THREAD_NO_FLAGS;
  return uv_thread_create_ex(tid, &params, entry, arg);
}

int uv_thread_create_ex(uv_thread_t* tid,
                        const uv_thread_options_t* params,
                        void (*entry)(void *arg),
                        void *arg) {
  struct thread_ctx* ctx;
  int err;
  HANDLE thread;
  SYSTEM_INFO sysinfo;
  size_t stack_size;
  size_t pagesize;

  stack_size =
      params->flags & UV_THREAD_HAS_STACK_SIZE ? params->stack_size : 0;

  if (stack_size != 0) {
    GetNativeSystemInfo(&sysinfo);
    pagesize = (size_t)sysinfo.dwPageSize;
    /* Round up to the nearest page boundary. */
    stack_size = (stack_size + pagesize - 1) &~ (pagesize - 1);

    if ((unsigned)stack_size != stack_size)
      return UV_EINVAL;
  }

  ctx = uv__malloc(sizeof(*ctx));
  if (ctx == NULL)
    return UV_ENOMEM;

  ctx->entry = entry;
  ctx->arg = arg;

  /* Create the thread in suspended state so we have a chance to pass
   * its own creation handle to it */
  thread = (HANDLE) _beginthreadex(NULL,
                                   (unsigned)stack_size,
                                   uv__thread_start,
                                   ctx,
                                   CREATE_SUSPENDED,
                                   NULL);
  if (thread == NULL) {
    err = errno;
    uv__free(ctx);
  } else {
    err = 0;
    *tid = thread;
    ctx->self = thread;
    ResumeThread(thread);
  }

  switch (err) {
    case 0:
      return 0;
    case EACCES:
      return UV_EACCES;
    case EAGAIN:
      return UV_EAGAIN;
    case EINVAL:
      return UV_EINVAL;
  }

  return UV_EIO;
}


uv_thread_t uv_thread_self(void) {
  uv_thread_t key;
  uv_once(&uv__current_thread_init_guard, uv__init_current_thread_key);
  key = uv_key_get(&uv__current_thread_key);
  if (key == NULL) {
      /* If the thread wasn't started by uv_thread_create (such as the main
       * thread), we assign an id to it now. */
      if (!DuplicateHandle(GetCurrentProcess(), GetCurrentThread(),
                           GetCurrentProcess(), &key, 0,
                           FALSE, DUPLICATE_SAME_ACCESS)) {
          uv_fatal_error(GetLastError(), "DuplicateHandle");
      }
      uv_key_set(&uv__current_thread_key, key);
  }
  return key;
}


int uv_thread_join(uv_thread_t *tid) {
  if (WaitForSingleObject(*tid, INFINITE))
    return uv_translate_sys_error(GetLastError());
  else {
    CloseHandle(*tid);
    *tid = 0;
    MemoryBarrier();  /* For feature parity with pthread_join(). */
    return 0;
  }
}


int uv_thread_equal(const uv_thread_t* t1, const uv_thread_t* t2) {
  return *t1 == *t2;
}


int uv_mutex_init(uv_mutex_t* mutex) {
  InitializeCriticalSection(mutex);
  return 0;
}


int uv_mutex_init_recursive(uv_mutex_t* mutex) {
  return uv_mutex_init(mutex);
}


void uv_mutex_destroy(uv_mutex_t* mutex) {
  DeleteCriticalSection(mutex);
}


void uv_mutex_lock(uv_mutex_t* mutex) {
  EnterCriticalSection(mutex);
}


int uv_mutex_trylock(uv_mutex_t* mutex) {
  if (TryEnterCriticalSection(mutex))
    return 0;
  else
    return UV_EBUSY;
}


void uv_mutex_unlock(uv_mutex_t* mutex) {
  LeaveCriticalSection(mutex);
}

/* Ensure that the ABI for this type remains stable in v1.x */
#ifdef _WIN64
// STATIC_ASSERT(sizeof(uv_rwlock_t) == 80);
#else
// STATIC_ASSERT(sizeof(uv_rwlock_t) == 48);
#endif

int uv_rwlock_init(uv_rwlock_t* rwlock) {
  // memset(rwlock, 0, sizeof(*rwlock));
  // InitializeSRWLock(&rwlock->read_write_lock_);

  // return 0;
  if (uv_mutex_init(&rwlock->fallback_.read_mutex_))
    return -1;

  if (uv_mutex_init(&rwlock->fallback_.write_mutex_)) {
    uv_mutex_destroy(&rwlock->fallback_.read_mutex_);
    return -1;
  }

  rwlock->fallback_.num_readers_ = 0;

  return 0;
}


void uv_rwlock_destroy(uv_rwlock_t* rwlock) {
  /* SRWLock does not need explicit destruction so long as there are no waiting threads
     See: https://docs.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initializesrwlock#remarks */
  uv_mutex_destroy(&rwlock->fallback_.read_mutex_);
  uv_mutex_destroy(&rwlock->fallback_.write_mutex_);
}


void uv_rwlock_rdlock(uv_rwlock_t* rwlock) {
  // AcquireSRWLockShared(&rwlock->read_write_lock_);
  uv_mutex_lock(&rwlock->fallback_.read_mutex_);

  if (++rwlock->fallback_.num_readers_ == 1)
    uv_mutex_lock(&rwlock->fallback_.write_mutex_);

  uv_mutex_unlock(&rwlock->fallback_.read_mutex_);
}


int uv_rwlock_tryrdlock(uv_rwlock_t* rwlock) {
  // if (!TryAcquireSRWLockShared(&rwlock->read_write_lock_))
    // return UV_EBUSY;

  // return 0;
  int ret;

  ret = -1;

  if (uv_mutex_trylock(&rwlock->fallback_.read_mutex_))
    goto out;

  if (rwlock->fallback_.num_readers_ == 0)
    ret = uv_mutex_trylock(&rwlock->fallback_.write_mutex_);
  else
    ret = 0;

  if (ret == 0)
    rwlock->fallback_.num_readers_++;

  uv_mutex_unlock(&rwlock->fallback_.read_mutex_);

out:
  return ret;
}


void uv_rwlock_rdunlock(uv_rwlock_t* rwlock) {
  // ReleaseSRWLockShared(&rwlock->read_write_lock_);
  uv_mutex_lock(&rwlock->fallback_.read_mutex_);

  if (--rwlock->fallback_.num_readers_ == 0)
    uv_mutex_unlock(&rwlock->fallback_.write_mutex_);

  uv_mutex_unlock(&rwlock->fallback_.read_mutex_);
}


void uv_rwlock_wrlock(uv_rwlock_t* rwlock) {
  // AcquireSRWLockExclusive(&rwlock->read_write_lock_);
  uv_mutex_lock(&rwlock->fallback_.write_mutex_);
}


int uv_rwlock_trywrlock(uv_rwlock_t* rwlock) {
  // if (!TryAcquireSRWLockExclusive(&rwlock->read_write_lock_))
    // return UV_EBUSY;

  // return 0;
  return uv_mutex_trylock(&rwlock->fallback_.write_mutex_);
}


void uv_rwlock_wrunlock(uv_rwlock_t* rwlock) {
  // ReleaseSRWLockExclusive(&rwlock->read_write_lock_);
  uv_mutex_unlock(&rwlock->fallback_.write_mutex_);
}


int uv_sem_init(uv_sem_t* sem, unsigned int value) {
  *sem = CreateSemaphore(NULL, value, INT_MAX, NULL);
  if (*sem == NULL)
    return uv_translate_sys_error(GetLastError());
  else
    return 0;
}


void uv_sem_destroy(uv_sem_t* sem) {
  if (!CloseHandle(*sem))
    abort();
}


void uv_sem_post(uv_sem_t* sem) {
  if (!ReleaseSemaphore(*sem, 1, NULL))
    abort();
}


void uv_sem_wait(uv_sem_t* sem) {
  if (WaitForSingleObject(*sem, INFINITE) != WAIT_OBJECT_0)
    abort();
}


int uv_sem_trywait(uv_sem_t* sem) {
  DWORD r = WaitForSingleObject(*sem, 0);

  if (r == WAIT_OBJECT_0)
    return 0;

  if (r == WAIT_TIMEOUT)
    return UV_EAGAIN;

  abort();
  return -1; /* Satisfy the compiler. */
}


int uv_cond_init(uv_cond_t* cond) {
  cond->waiting= 0;
  InitializeCriticalSection(&cond->lock_waiting);
    
  cond->events[SIGNAL]= CreateEvent(NULL,  /* no security */
                                    FALSE, /* auto-reset event */
                                    FALSE, /* non-signaled initially */
                                    NULL); /* unnamed */

  /* Create a manual-reset event. */
  cond->events[BROADCAST]= CreateEvent(NULL,  /* no security */
                                       TRUE,  /* manual-reset */
                                       FALSE, /* non-signaled initially */
                                       NULL); /* unnamed */


  cond->broadcast_block_event= CreateEvent(NULL,  /* no security */
                                           TRUE,  /* manual-reset */
                                           TRUE,  /* signaled initially */
                                           NULL); /* unnamed */
  
  if( cond->events[SIGNAL] == NULL ||
      cond->events[BROADCAST] == NULL ||
      cond->broadcast_block_event == NULL )
    return ENOMEM;
  return 0;
}


void uv_cond_destroy(uv_cond_t* cond) {
  // /* nothing to do */
  // (void) &cond;
  DeleteCriticalSection(&cond->lock_waiting);

  if (CloseHandle(cond->events[SIGNAL]) == 0 ||
      CloseHandle(cond->events[BROADCAST]) == 0 ||
      CloseHandle(cond->broadcast_block_event) == 0)
    return EINVAL;
  return 0;
}


void uv_cond_signal(uv_cond_t* cond) {
  // WakeConditionVariable(&cond->cond_var);
  EnterCriticalSection(&cond->lock_waiting);
  
  if(cond->waiting > 0)
    SetEvent(cond->events[SIGNAL]);

  LeaveCriticalSection(&cond->lock_waiting);
  
  return 0;
}


void uv_cond_broadcast(uv_cond_t* cond) {
  // WakeAllConditionVariable(&cond->cond_var);
  EnterCriticalSection(&cond->lock_waiting);
  /*
     The mutex protect us from broadcasting if
     there isn't any thread waiting to open the
     block gate after this call has closed it.
   */
  if(cond->waiting > 0)
  {
    /* Close block gate */
    ResetEvent(cond->broadcast_block_event); 
    /* Open broadcast gate */
    SetEvent(cond->events[BROADCAST]);
  }

  LeaveCriticalSection(&cond->lock_waiting);  

  return 0;
}


void uv_cond_wait(uv_cond_t* cond, uv_mutex_t* mutex) {
  // if (!SleepConditionVariableCS(&cond->cond_var, mutex, INFINITE))
    // abort();
  int result;
  /* 
    Block access if previous broadcast hasn't finished.
    This is just for safety and should normally not
    affect the total time spent in this function.
  */
  WaitForSingleObject(cond->broadcast_block_event, INFINITE);

  EnterCriticalSection(&cond->lock_waiting);
  cond->waiting++;
  LeaveCriticalSection(&cond->lock_waiting);

  LeaveCriticalSection(mutex);
  result= WaitForMultipleObjects(2, cond->events, FALSE, INFINITE);
  
  EnterCriticalSection(&cond->lock_waiting);
  cond->waiting--;
  
  if (cond->waiting == 0)
  {
    /*
      We're the last waiter to be notified or to stop waiting, so
      reset the manual event. 
    */
    /* Close broadcast gate */
    ResetEvent(cond->events[BROADCAST]);
    /* Open block gate */
    SetEvent(cond->broadcast_block_event);
  }
  LeaveCriticalSection(&cond->lock_waiting);
  
  EnterCriticalSection(mutex);

  return result == WAIT_TIMEOUT ? ETIMEDOUT : 0;
}

int uv_cond_timedwait(uv_cond_t* cond, uv_mutex_t* mutex, uint64_t timeout) {
  // if (SleepConditionVariableCS(&cond->cond_var, mutex, (DWORD)(timeout / 1e6)))
    // return 0;
  // if (GetLastError() != ERROR_TIMEOUT)
    // abort();
  // return UV_ETIMEDOUT;
  int result;

  // if( abstime != NULL )
  // {
    // GetSystemTimeAsFileTime(&now.ft);

    /*
      Calculate time left to abstime
      - subtract start time from current time(values are in 100ns units)
      - convert to millisec by dividing with 10000
    */
    // timeout= (long)((abstime->tv.i64 - now.i64) / 10000);
    
    /* Don't allow the timeout to be negative */
    // if (timeout < 0)
      // timeout= 0L;

    /*
      Make sure the calucated timeout does not exceed original timeout
      value which could cause "wait for ever" if system time changes
    */
    // if (timeout > abstime->max_timeout_msec)
      // timeout= abstime->max_timeout_msec;

  // }
  // else
  // {
    // /* No time specified; don't expire */
    // timeout= INFINITE;
  // }

  /* 
    Block access if previous broadcast hasn't finished.
    This is just for safety and should normally not
    affect the total time spent in this function.
  */
  WaitForSingleObject(cond->broadcast_block_event, INFINITE);

  EnterCriticalSection(&cond->lock_waiting);
  cond->waiting++;
  LeaveCriticalSection(&cond->lock_waiting);

  LeaveCriticalSection(mutex);
  result= WaitForMultipleObjects(2, cond->events, FALSE, timeout);
  
  EnterCriticalSection(&cond->lock_waiting);
  cond->waiting--;
  
  if (cond->waiting == 0)
  {
    /*
      We're the last waiter to be notified or to stop waiting, so
      reset the manual event. 
    */
    /* Close broadcast gate */
    ResetEvent(cond->events[BROADCAST]);
    /* Open block gate */
    SetEvent(cond->broadcast_block_event);
  }
  LeaveCriticalSection(&cond->lock_waiting);
  
  EnterCriticalSection(mutex);

  return result == WAIT_TIMEOUT ? ETIMEDOUT : 0;
}


int uv_barrier_init(uv_barrier_t* barrier, unsigned int count) {
  int err;

  barrier->n = count;
  barrier->count = 0;

  err = uv_mutex_init(&barrier->mutex);
  if (err)
    return err;

  err = uv_sem_init(&barrier->turnstile1, 0);
  if (err)
    goto error2;

  err = uv_sem_init(&barrier->turnstile2, 1);
  if (err)
    goto error;

  return 0;

error:
  uv_sem_destroy(&barrier->turnstile1);
error2:
  uv_mutex_destroy(&barrier->mutex);
  return err;

}


void uv_barrier_destroy(uv_barrier_t* barrier) {
  uv_sem_destroy(&barrier->turnstile2);
  uv_sem_destroy(&barrier->turnstile1);
  uv_mutex_destroy(&barrier->mutex);
}


int uv_barrier_wait(uv_barrier_t* barrier) {
  int serial_thread;

  uv_mutex_lock(&barrier->mutex);
  if (++barrier->count == barrier->n) {
    uv_sem_wait(&barrier->turnstile2);
    uv_sem_post(&barrier->turnstile1);
  }
  uv_mutex_unlock(&barrier->mutex);

  uv_sem_wait(&barrier->turnstile1);
  uv_sem_post(&barrier->turnstile1);

  uv_mutex_lock(&barrier->mutex);
  serial_thread = (--barrier->count == 0);
  if (serial_thread) {
    uv_sem_wait(&barrier->turnstile1);
    uv_sem_post(&barrier->turnstile2);
  }
  uv_mutex_unlock(&barrier->mutex);

  uv_sem_wait(&barrier->turnstile2);
  uv_sem_post(&barrier->turnstile2);
  return serial_thread;
}


int uv_key_create(uv_key_t* key) {
  key->tls_index = TlsAlloc();
  if (key->tls_index == TLS_OUT_OF_INDEXES)
    return UV_ENOMEM;
  return 0;
}


void uv_key_delete(uv_key_t* key) {
  if (TlsFree(key->tls_index) == FALSE)
    abort();
  key->tls_index = TLS_OUT_OF_INDEXES;
}


void* uv_key_get(uv_key_t* key) {
  void* value;

  value = TlsGetValue(key->tls_index);
  if (value == NULL)
    if (GetLastError() != ERROR_SUCCESS)
      abort();

  return value;
}


void uv_key_set(uv_key_t* key, void* value) {
  if (TlsSetValue(key->tls_index, value) == FALSE)
    abort();
}
