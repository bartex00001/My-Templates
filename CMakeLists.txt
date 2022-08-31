set(CMAKE_REQUIRED_VERSION 3.14)
cmake_minimum_required(VERSION ${CMAKE_REQUIRED_VERSION})

project(
    Template 
    LANGUAGES CXX 
    VERSION 0.1 
    DESCRIPTION "A template for cmake projects")

# Set global properties and tests only in the root of the project
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    set(CMAKE_CXX_EXTENSIONS OFF)
    
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)

    # Disable targets created by CTest
    set_property(GLOBAL PROPERTY CTEST_TARGETS_ADDED 1)

    # Set global project properties here
    # ...

    include(CTest)
endif()

include(FetchContent)

# Fetch additional modules here
# ...

add_subdirectory(src)

add_subdirectory(apps)

# Add googletest as a submodule via git
# git submodule add git@github.com:google/googletest.git extern/googletest

# Add tests only from root
option(PACKAGE_TESTS "Build the tests" ON)
if(PACKAGE_TESTS)
    enable_testing()
    include(GoogleTest)
    add_subdirectory(tests)
endif()
