
set(target hello-world)

add_executable(${target} ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)

# if (BUILD_SHARED_LIBS)
#     set_target_properties(${target} PROPERTIES
#                           POSITION_INDEPENDENT_CODE ON
#                           )
# endif()