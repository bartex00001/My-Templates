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


# Automatically download and update submodules
find_package(Git QUIET)
if(GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
# Update submodules as needed
    option(GIT_SUBMODULE "Check submodules during build" ON)
    if(GIT_SUBMODULE)
        message(STATUS "Submodule update")
        execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive
                        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                        RESULT_VARIABLE GIT_SUBMOD_RESULT)
        if(NOT GIT_SUBMOD_RESULT EQUAL "0")
            message(FATAL_ERROR "git submodule update --init --recursive failed with ${GIT_SUBMOD_RESULT}, please checkout submodules")
        endif()
    endif()
endif()


add_subdirectory(src)

add_subdirectory(apps)


# Add tests only from root
option(PACKAGE_TESTS "Build the tests" ON)
if(PACKAGE_TESTS)
    enable_testing()
    include(GoogleTest)
    add_subdirectory(tests)
endif()
