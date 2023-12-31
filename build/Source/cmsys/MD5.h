/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file Copyright.txt or https://cmake.org/licensing#kwsys for details.  */
#ifndef cmsys_MD5_h
#define cmsys_MD5_h

#include <cmsys/Configure.h>

/* Redefine all public interface symbol names to be in the proper
   namespace.  These macros are used internally to kwsys only, and are
   not visible to user code.  Use kwsysHeaderDump.pl to reproduce
   these macros after making changes to the interface.  */
#if !defined(KWSYS_NAMESPACE)
#  define kwsys_ns(x) cmsys##x
#  define kwsysEXPORT cmsys_EXPORT
#endif
#if !cmsys_NAME_IS_KWSYS
#  define kwsysMD5 kwsys_ns(MD5)
#  define kwsysMD5_s kwsys_ns(MD5_s)
#  define kwsysMD5_New kwsys_ns(MD5_New)
#  define kwsysMD5_Delete kwsys_ns(MD5_Delete)
#  define kwsysMD5_Initialize kwsys_ns(MD5_Initialize)
#  define kwsysMD5_Append kwsys_ns(MD5_Append)
#  define kwsysMD5_Finalize kwsys_ns(MD5_Finalize)
#  define kwsysMD5_FinalizeHex kwsys_ns(MD5_FinalizeHex)
#  define kwsysMD5_DigestToHex kwsys_ns(MD5_DigestToHex)
#endif

#if defined(__cplusplus)
extern "C" {
#endif

/**
 * MD5 state data structure.
 */
typedef struct kwsysMD5_s kwsysMD5;

/**
 * Create a new MD5 instance.  The returned instance is not initialized.
 */
kwsysEXPORT kwsysMD5* kwsysMD5_New(void);

/**
 * Delete an old MD5 instance.
 */
kwsysEXPORT void kwsysMD5_Delete(kwsysMD5* md5);

/**
 * Initialize a new MD5 digest.
 */
kwsysEXPORT void kwsysMD5_Initialize(kwsysMD5* md5);

/**
 * Append data to an MD5 digest.  If the given length is negative,
 * data will be read up to but not including a terminating null.
 */
kwsysEXPORT void kwsysMD5_Append(kwsysMD5* md5, unsigned char const* data,
                                 int length);

/**
 * Finalize a MD5 digest and get the 16-byte hash value.
 */
kwsysEXPORT void kwsysMD5_Finalize(kwsysMD5* md5, unsigned char digest[16]);

/**
 * Finalize a MD5 digest and get the 32-bit hexadecimal representation.
 */
kwsysEXPORT void kwsysMD5_FinalizeHex(kwsysMD5* md5, char buffer[32]);

/**
 * Convert a MD5 digest 16-byte value to a 32-byte hexadecimal representation.
 */
kwsysEXPORT void kwsysMD5_DigestToHex(unsigned char const digest[16],
                                      char buffer[32]);

#if defined(__cplusplus)
} /* extern "C" */
#endif

/* If we are building a kwsys .c or .cxx file, let it use these macros.
   Otherwise, undefine them to keep the namespace clean.  */
#if !defined(KWSYS_NAMESPACE)
#  undef kwsys_ns
#  undef kwsysEXPORT
#  if !cmsys_NAME_IS_KWSYS
#    undef kwsysMD5
#    undef kwsysMD5_s
#    undef kwsysMD5_New
#    undef kwsysMD5_Delete
#    undef kwsysMD5_Initialize
#    undef kwsysMD5_Append
#    undef kwsysMD5_Finalize
#    undef kwsysMD5_FinalizeHex
#    undef kwsysMD5_DigestToHex
#  endif
#endif

#endif
