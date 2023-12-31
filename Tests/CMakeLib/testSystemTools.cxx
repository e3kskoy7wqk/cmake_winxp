/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file Copyright.txt or https://cmake.org/licensing for details.  */

#include <cmConfigure.h> // IWYU pragma: keep

#include <iostream>
#include <string>
#include <vector>

#include <stddef.h>

#include "cmSystemTools.h"

#define cmPassed(m) std::cout << "Passed: " << (m) << "\n"
#define cmFailed(m)                                                           \
  std::cout << "FAILED: " << (m) << "\n";                                     \
  failed = 1

#define cmAssert(exp, m)                                                      \
  do {                                                                        \
    if ((exp)) {                                                              \
      cmPassed(m);                                                            \
    } else {                                                                  \
      cmFailed(m);                                                            \
    }                                                                         \
  } while (false)

int testSystemTools(int /*unused*/, char* /*unused*/[])
{
  int failed = 0;
  // ----------------------------------------------------------------------
  // Test cmSystemTools::UpperCase
  std::string str = "abc";
  std::string strupper = "ABC";
  cmAssert(cmSystemTools::UpperCase(str) == strupper,
           "cmSystemTools::UpperCase");

  // ----------------------------------------------------------------------
  // Test cmSystemTools::VersionCompare
  cmAssert(cmSystemTools::VersionCompareEqual("", ""),
           "VersionCompareEqual empty string");
  cmAssert(!cmSystemTools::VersionCompareGreater("", ""),
           "VersionCompareGreater empty string");
  cmAssert(cmSystemTools::VersionCompareEqual("1", "1a"),
           "VersionCompareEqual letters");
  cmAssert(!cmSystemTools::VersionCompareGreater("1", "1a"),
           "VersionCompareGreater letters");
  cmAssert(cmSystemTools::VersionCompareEqual("001", "1"),
           "VersionCompareEqual leading zeros equal");
  cmAssert(!cmSystemTools::VersionCompareGreater("001", "1"),
           "VersionCompareGreater leading zeros equal");
  cmAssert(!cmSystemTools::VersionCompareEqual("002", "1"),
           "VersionCompareEqual leading zeros greater");
  cmAssert(cmSystemTools::VersionCompareGreater("002", "1"),
           "VersionCompareGreater leading zeros greater");
  cmAssert(!cmSystemTools::VersionCompareEqual("6.2.1", "6.3.1"),
           "VersionCompareEqual components less");
  cmAssert(!cmSystemTools::VersionCompareGreater("6.2.1", "6.3.1"),
           "VersionCompareGreater components less");
  cmAssert(!cmSystemTools::VersionCompareEqual("6.2.1", "6.2"),
           "VersionCompareEqual different length");
  cmAssert(cmSystemTools::VersionCompareGreater("6.2.1", "6.2"),
           "VersionCompareGreater different length");
  cmAssert(
    !cmSystemTools::VersionCompareEqual(
      "3.14159265358979323846264338327950288419716939937510582097494459230",
      "3.14159265358979323846264338327950288419716939937510582097494459231"),
    "VersionCompareEqual long number");
  cmAssert(
    !cmSystemTools::VersionCompareGreater(
      "3.14159265358979323846264338327950288419716939937510582097494459230",
      "3.14159265358979323846264338327950288419716939937510582097494459231"),
    "VersionCompareGreater long number");
  cmAssert(
    !cmSystemTools::VersionCompareEqual(
      "3.141592653589793238462643383279502884197169399375105820974944592307",
      "3.14159265358979323846264338327950288419716939937510582097494459231"),
    "VersionCompareEqual more digits");
  cmAssert(
    cmSystemTools::VersionCompareGreater(
      "3.141592653589793238462643383279502884197169399375105820974944592307",
      "3.14159265358979323846264338327950288419716939937510582097494459231"),
    "VersionCompareGreater more digits");

  // ----------------------------------------------------------------------
  // Test cmSystemTools::strverscmp
  cmAssert(cmSystemTools::strverscmp("", "") == 0, "strverscmp empty string");
  cmAssert(cmSystemTools::strverscmp("abc", "") > 0,
           "strverscmp string vs empty string");
  cmAssert(cmSystemTools::strverscmp("abc", "abc") == 0,
           "strverscmp same string");
  cmAssert(cmSystemTools::strverscmp("abd", "abc") > 0,
           "strverscmp character string");
  cmAssert(cmSystemTools::strverscmp("abc", "abd") < 0,
           "strverscmp symmetric");
  cmAssert(cmSystemTools::strverscmp("12345", "12344") > 0,
           "strverscmp natural numbers");
  cmAssert(cmSystemTools::strverscmp("100", "99") > 0,
           "strverscmp natural numbers different digits");
  cmAssert(cmSystemTools::strverscmp("12345", "00345") > 0,
           "strverscmp natural against decimal (same length)");
  cmAssert(cmSystemTools::strverscmp("99999999999999", "99999999999991") > 0,
           "strverscmp natural overflow");
  cmAssert(cmSystemTools::strverscmp("00000000000009", "00000000000001") > 0,
           "strverscmp decimal precision");
  cmAssert(cmSystemTools::strverscmp("a.b.c.0", "a.b.c.000") > 0,
           "strverscmp multiple zeros");
  cmAssert(cmSystemTools::strverscmp("lib_1.2_10", "lib_1.2_2") > 0,
           "strverscmp last number ");
  cmAssert(cmSystemTools::strverscmp("12lib", "2lib") > 0,
           "strverscmp first number ");
  cmAssert(cmSystemTools::strverscmp("02lib", "002lib") > 0,
           "strverscmp first number decimal ");
  cmAssert(cmSystemTools::strverscmp("10", "9a") > 0,
           "strverscmp letter filler ");
  cmAssert(cmSystemTools::strverscmp("000", "0001") > 0,
           "strverscmp zero and leading zeros  ");

  // test sorting using standard strvercmp input
  std::vector<std::string> testString;
  testString.push_back("000");
  testString.push_back("00");
  testString.push_back("01");
  testString.push_back("010");
  testString.push_back("09");
  testString.push_back("0");
  testString.push_back("1");
  testString.push_back("9");
  testString.push_back("10");

  // test global ordering of input strings
  for (size_t i = 0; i < testString.size() - 1; i++) {
    for (size_t j = i + 1; j < testString.size(); j++) {
      if (cmSystemTools::strverscmp(testString[i], testString[j]) >= 0) {
        cmFailed("cmSystemTools::strverscmp error in comparing strings " +
                 testString[i] + " " + testString[j]);
      }
    }
  }

  if (!failed) {
    cmPassed("cmSystemTools::strverscmp working");
  }

  return failed;
}
