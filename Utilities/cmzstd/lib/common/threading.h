/**
 * Copyright (c) 2016 Tino Reichardt
 * All rights reserved.
 *
 * You can contact the author at:
 * - zstdmt source repository: https://github.com/mcmilk/zstdmt
 *
 * This source code is licensed under both the BSD-style license (found in the
 * LICENSE file in the root directory of this source tree) and the GPLv2 (found
 * in the COPYING file in the root directory of this source tree).
 * You may select, at your option, one of the above-listed licenses.
 */

#ifndef THREADING_H_938743
#define THREADING_H_938743

#include "debug.h"

#if defined (__cplusplus)
extern "C" {
#endif

#if defined(ZSTD_MULTITHREAD) && defined(_WIN32)

/**
 * Windows minimalist Pthread Wrapper
 */
#ifdef WINVER
#  undef WINVER
#endif
#define WINVER       0x0600

#ifdef _WIN32_WINNT
#  undef _WIN32_WINNT
#endif
#define _WIN32_WINNT 0x0600

#ifndef WIN32_LEAN_AND_MEAN
#  define WIN32_LEAN_AND_MEAN
#endif

#undef ERROR   /* reported already defined on VS 2015 (Rich Geldreich) */
#include <windows.h>
#undef ERROR
#define ERROR(name) ZSTD_ERROR(name)

typedef struct {
  unsigned int waiting;
  CRITICAL_SECTION lock_waiting;
 
  enum {
    SIGNAL= 0,
    BROADCAST= 1,
    MAX_EVENTS= 2
  } EVENTS;

  HANDLE events[MAX_EVENTS];
  HANDLE broadcast_block_event;

} pthread_cond_t;

typedef struct { int dummy; } pthread_condattr_t;
typedef CRITICAL_SECTION pthread_mutex_t;

/* mutex */
#define ZSTD_pthread_mutex_t           CRITICAL_SECTION
#define ZSTD_pthread_mutex_init(a, b)  ((void)(b), InitializeCriticalSection((a)), 0)
#define ZSTD_pthread_mutex_destroy(a)  DeleteCriticalSection((a))
#define ZSTD_pthread_mutex_lock(a)     EnterCriticalSection((a))
#define ZSTD_pthread_mutex_unlock(a)   LeaveCriticalSection((a))

/* condition variable */
#define ZSTD_pthread_cond_t             pthread_cond_t
// #define ZSTD_pthread_cond_init(a, b)    ((void)(b), InitializeConditionVariable((a)), 0)
// #define ZSTD_pthread_cond_destroy(a)    ((void)(a))
// #define ZSTD_pthread_cond_wait(a, b)    SleepConditionVariableCS((a), (b), INFINITE)
// #define ZSTD_pthread_cond_signal(a)     WakeConditionVariable((a))
// #define ZSTD_pthread_cond_broadcast(a)  WakeAllConditionVariable((a))

static int ZSTD_pthread_cond_init(pthread_cond_t *cond, const pthread_condattr_t *attr)
{
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
    return 22;
  return 0;
}

static int ZSTD_pthread_cond_destroy(pthread_cond_t *cond)
{
  DeleteCriticalSection(&cond->lock_waiting);

  if (CloseHandle(cond->events[SIGNAL]) == 0 ||
      CloseHandle(cond->events[BROADCAST]) == 0 ||
      CloseHandle(cond->broadcast_block_event) == 0)
    return 22;
  return 0;
}

static int ZSTD_pthread_cond_wait(pthread_cond_t *cond, pthread_mutex_t *mutex)
{
  int result;
  long timeout; 
  // union ft64 now;

    /* No time specified; don't expire */
    timeout= INFINITE;

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

  return result == WAIT_TIMEOUT ? 145 : 0;
}

static int ZSTD_pthread_cond_signal(pthread_cond_t *cond)
{
  EnterCriticalSection(&cond->lock_waiting);
  
  if(cond->waiting > 0)
    SetEvent(cond->events[SIGNAL]);

  LeaveCriticalSection(&cond->lock_waiting);
  
  return 0;
}


static int ZSTD_pthread_cond_broadcast(pthread_cond_t *cond)
{
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


/* ZSTD_pthread_create() and ZSTD_pthread_join() */
typedef HANDLE ZSTD_pthread_t;

int ZSTD_pthread_create(ZSTD_pthread_t* thread, const void* unused,
                   void* (*start_routine) (void*), void* arg);

int ZSTD_pthread_join(ZSTD_pthread_t thread);

/**
 * add here more wrappers as required
 */


#elif defined(ZSTD_MULTITHREAD)    /* posix assumed ; need a better detection method */
/* ===   POSIX Systems   === */
#  include <pthread.h>

#if DEBUGLEVEL < 1

#define ZSTD_pthread_mutex_t            pthread_mutex_t
#define ZSTD_pthread_mutex_init(a, b)   pthread_mutex_init((a), (b))
#define ZSTD_pthread_mutex_destroy(a)   pthread_mutex_destroy((a))
#define ZSTD_pthread_mutex_lock(a)      pthread_mutex_lock((a))
#define ZSTD_pthread_mutex_unlock(a)    pthread_mutex_unlock((a))

#define ZSTD_pthread_cond_t             pthread_cond_t
#define ZSTD_pthread_cond_init(a, b)    pthread_cond_init((a), (b))
#define ZSTD_pthread_cond_destroy(a)    pthread_cond_destroy((a))
#define ZSTD_pthread_cond_wait(a, b)    pthread_cond_wait((a), (b))
#define ZSTD_pthread_cond_signal(a)     pthread_cond_signal((a))
#define ZSTD_pthread_cond_broadcast(a)  pthread_cond_broadcast((a))

#define ZSTD_pthread_t                  pthread_t
#define ZSTD_pthread_create(a, b, c, d) pthread_create((a), (b), (c), (d))
#define ZSTD_pthread_join(a)         pthread_join((a),NULL)

#else /* DEBUGLEVEL >= 1 */

/* Debug implementation of threading.
 * In this implementation we use pointers for mutexes and condition variables.
 * This way, if we forget to init/destroy them the program will crash or ASAN
 * will report leaks.
 */

#define ZSTD_pthread_mutex_t            pthread_mutex_t*
int ZSTD_pthread_mutex_init(ZSTD_pthread_mutex_t* mutex, pthread_mutexattr_t const* attr);
int ZSTD_pthread_mutex_destroy(ZSTD_pthread_mutex_t* mutex);
#define ZSTD_pthread_mutex_lock(a)      pthread_mutex_lock(*(a))
#define ZSTD_pthread_mutex_unlock(a)    pthread_mutex_unlock(*(a))

#define ZSTD_pthread_cond_t             pthread_cond_t*
int ZSTD_pthread_cond_init(ZSTD_pthread_cond_t* cond, pthread_condattr_t const* attr);
int ZSTD_pthread_cond_destroy(ZSTD_pthread_cond_t* cond);
#define ZSTD_pthread_cond_wait(a, b)    pthread_cond_wait(*(a), *(b))
#define ZSTD_pthread_cond_signal(a)     pthread_cond_signal(*(a))
#define ZSTD_pthread_cond_broadcast(a)  pthread_cond_broadcast(*(a))

#define ZSTD_pthread_t                  pthread_t
#define ZSTD_pthread_create(a, b, c, d) pthread_create((a), (b), (c), (d))
#define ZSTD_pthread_join(a)         pthread_join((a),NULL)

#endif

#else  /* ZSTD_MULTITHREAD not defined */
/* No multithreading support */

typedef int ZSTD_pthread_mutex_t;
#define ZSTD_pthread_mutex_init(a, b)   ((void)(a), (void)(b), 0)
#define ZSTD_pthread_mutex_destroy(a)   ((void)(a))
#define ZSTD_pthread_mutex_lock(a)      ((void)(a))
#define ZSTD_pthread_mutex_unlock(a)    ((void)(a))

typedef int ZSTD_pthread_cond_t;
#define ZSTD_pthread_cond_init(a, b)    ((void)(a), (void)(b), 0)
#define ZSTD_pthread_cond_destroy(a)    ((void)(a))
#define ZSTD_pthread_cond_wait(a, b)    ((void)(a), (void)(b))
#define ZSTD_pthread_cond_signal(a)     ((void)(a))
#define ZSTD_pthread_cond_broadcast(a)  ((void)(a))

/* do not use ZSTD_pthread_t */

#endif /* ZSTD_MULTITHREAD */

#if defined (__cplusplus)
}
#endif

#endif /* THREADING_H_938743 */
