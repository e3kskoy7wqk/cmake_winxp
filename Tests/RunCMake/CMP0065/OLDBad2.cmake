enable_language(C)
include(BuildTargetInSubProject.cmake)

BuildTargetInSubProject(TestPolicyCMP0065 FooOLDBad2 FALSE)
