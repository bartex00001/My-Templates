# Two arguments are necessary because we need to grt to the root
add_subdirectory("${PROJECT_SOURCE_DIR}/extern/googletest" "extern/googletest")

# Cleaner googletest build
mark_as_advanced(
    BUILD_GMOCK BUILD_GTEST BUILD_SHARED_LIBS
    gmock_build_tests gtest_build_samples gtest_build_tests
    gtest_disable_pthreads gtest_force_shared_crt gtest_hide_internal_symbols
)

set_target_properties(gtest PROPERTIES FOLDER extern)
set_target_properties(gtest_main PROPERTIES FOLDER extern)
set_target_properties(gmock PROPERTIES FOLDER extern)
set_target_properties(gmock_main PROPERTIES FOLDER extern)


add_executable(tests tests.cpp)

target_compile_features(tests PRIVATE cxx_std_20)

target_link_libraries(tests PRIVATE 
    exLibrary 
    gtest
    gmock
    gmock_main)
    
gtest_discover_tests(tests)
