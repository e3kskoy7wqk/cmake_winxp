# UPPER_CASE FOUND vars and no header targets

set(Boost_DATE_TIME_FOUND 1)
add_library(Boost::date_time UNKNOWN IMPORTED)
set_target_properties(Boost::date_time PROPERTIES
  IMPORTED_CONFIGURATIONS RELEASE
  IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_LIST_DIR}/lib/libboost_date_time.a"
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/include"
  )
set(Boost_PYTHON37_FOUND 1)
add_library(Boost::python UNKNOWN IMPORTED)
set_target_properties(Boost::python PROPERTIES
  IMPORTED_CONFIGURATIONS "RELEASE;DEBUG"
  IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_LIST_DIR}/lib/libboost_python_release.a"
  IMPORTED_LOCATION_DEBUG "${CMAKE_CURRENT_LIST_DIR}/lib/libboost_python.a"
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/include"
  )
set(Boost_MPI_PYTHON2_FOUND 1)
add_library(Boost::mpi_python UNKNOWN IMPORTED)
set_target_properties(Boost::mpi_python PROPERTIES
  IMPORTED_CONFIGURATIONS "RELEASE;DEBUG"
  IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_LIST_DIR}/lib/libboost_mpi_python.a"
  IMPORTED_LOCATION_DEBUG "${CMAKE_CURRENT_LIST_DIR}/lib/libboost_mpi_python.a"
  INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/include"
  )
