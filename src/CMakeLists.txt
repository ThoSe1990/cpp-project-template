
set(target target-name)

add_library(cucumber ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)
add_executable(cucumber ${target} ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)


if (BUILD_SHARED_LIBS)
    set_target_properties(${target} PROPERTIES
                          POSITION_INDEPENDENT_CODE ON
                          )
endif()