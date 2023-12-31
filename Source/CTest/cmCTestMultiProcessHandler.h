/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file Copyright.txt or https://cmake.org/licensing for details.  */
#pragma once

#include "cmConfigure.h" // IWYU pragma: keep

#include <cstddef>
#include <map>
#include <memory>
#include <set>
#include <string>
#include <vector>

#include <cm3p/uv.h>

#include "cmCTest.h"
#include "cmCTestResourceAllocator.h"
#include "cmCTestTestHandler.h"
#include "cmUVHandlePtr.h"

struct cmCTestBinPackerAllocation;
class cmCTestResourceSpec;
class cmCTestRunTest;

/** \class cmCTestMultiProcessHandler
 * \brief run parallel ctest
 *
 * cmCTestMultiProcessHandler
 */
class cmCTestMultiProcessHandler
{
  friend class TestComparator;
  friend class cmCTestRunTest;

public:
  struct TestSet : public std::set<int>
  {
  };
  struct TestMap : public std::map<int, TestSet>
  {
  };
  struct TestList : public std::vector<int>
  {
  };
  struct PropertiesMap
    : public std::map<int, cmCTestTestHandler::cmCTestTestProperties*>
  {
  };
  struct ResourceAllocation
  {
    std::string Id;
    unsigned int Slots;
  };

  cmCTestMultiProcessHandler();
  virtual ~cmCTestMultiProcessHandler();
  // Set the tests
  void SetTests(TestMap& tests, PropertiesMap& properties);
  // Set the max number of tests that can be run at the same time.
  void SetParallelLevel(size_t);
  void SetTestLoad(unsigned long load);
  virtual void RunTests();
  void PrintOutputAsJson();
  void PrintTestList();
  void PrintLabels();

  void SetPassFailVectors(std::vector<std::string>* passed,
                          std::vector<std::string>* failed)
  {
    this->Passed = passed;
    this->Failed = failed;
  }
  void SetTestResults(std::vector<cmCTestTestHandler::cmCTestTestResult>* r)
  {
    this->TestResults = r;
  }

  void SetCTest(cmCTest* ctest) { this->CTest = ctest; }

  void SetTestHandler(cmCTestTestHandler* handler)
  {
    this->TestHandler = handler;
  }

  cmCTestTestHandler* GetTestHandler() { return this->TestHandler; }

  void SetRepeatMode(cmCTest::Repeat mode, int count)
  {
    this->RepeatMode = mode;
    this->RepeatCount = count;
  }

  void SetQuiet(bool b) { this->Quiet = b; }

  void InitResourceAllocator(const cmCTestResourceSpec& spec)
  {
    this->ResourceAllocator.InitializeFromResourceSpec(spec);
  }

  void CheckResourcesAvailable();

protected:
  // Start the next test or tests as many as are allowed by
  // ParallelLevel
  void StartNextTests();
  bool StartTestProcess(int test);
  bool StartTest(int test);
  // Mark the checkpoint for the given test
  void WriteCheckpoint(int index);

  void UpdateCostData();
  void ReadCostData();
  // Return index of a test based on its name
  int SearchByName(std::string const& name);

  void CreateTestCostList();

  void GetAllTestDependencies(int test, TestList& dependencies);
  void CreateSerialTestCostList();

  void CreateParallelTestCostList();

  // Removes the checkpoint file
  void MarkFinished();
  void EraseTest(int index);
  void FinishTestProcess(std::unique_ptr<cmCTestRunTest> runner, bool started);

  static void OnTestLoadRetryCB(uv_timer_t* timer);

  void RemoveTest(int index);
  // Check if we need to resume an interrupted test set
  void CheckResume();
  // Check if there are any circular dependencies
  bool CheckCycles();
  int FindMaxIndex();
  inline size_t GetProcessorsUsed(int index);
  std::string GetName(int index);

  bool CheckStopOnFailure();

  bool CheckStopTimePassed();
  void SetStopTimePassed();

  void LockResources(int index);
  void UnlockResources(int index);

  enum class ResourceAllocationError
  {
    NoResourceType,
    InsufficientResources,
  };

  bool AllocateResources(int index);
  bool TryAllocateResources(
    int index,
    std::map<std::string, std::vector<cmCTestBinPackerAllocation>>&
      allocations,
    std::map<std::string, ResourceAllocationError>* errors = nullptr);
  void DeallocateResources(int index);
  bool AllResourcesAvailable();

  // map from test number to set of depend tests
  TestMap Tests;
  TestList SortedTests;
  // Total number of tests we'll be running
  size_t Total;
  // Number of tests that are complete
  size_t Completed;
  size_t RunningCount;
  std::set<size_t> ProcessorsAvailable;
  size_t HaveAffinity;
  bool StopTimePassed = false;
  // list of test properties (indices concurrent to the test map)
  PropertiesMap Properties;
  std::map<int, bool> TestRunningMap;
  std::map<int, bool> TestFinishMap;
  std::map<int, std::string> TestOutput;
  std::vector<std::string>* Passed;
  std::vector<std::string>* Failed;
  std::vector<std::string> LastTestsFailed;
  std::set<std::string> LockedResources;
  std::map<int,
           std::vector<std::map<std::string, std::vector<ResourceAllocation>>>>
    AllocatedResources;
  std::map<int, std::map<std::string, ResourceAllocationError>>
    ResourceAllocationErrors;
  cmCTestResourceAllocator ResourceAllocator;
  std::vector<cmCTestTestHandler::cmCTestTestResult>* TestResults;
  size_t ParallelLevel; // max number of process that can be run at once
  unsigned long TestLoad;
  unsigned long FakeLoadForTesting;
  uv_loop_t Loop;
  cm::uv_timer_ptr TestLoadRetryTimer;
  cmCTestTestHandler* TestHandler;
  cmCTest* CTest;
  bool HasCycles;
  cmCTest::Repeat RepeatMode = cmCTest::Repeat::Never;
  int RepeatCount = 1;
  bool Quiet;
  bool SerialTestRunning;
};
