set(target unittests)

find_package(GTest)

if(GTest_FOUND)

  add_executable(${target} 
    # add files here
  )
  # link to targets from src here if needed
  target_link_libraries(${target} GTest::gtest_main)

endif()