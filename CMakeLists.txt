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

# Add googletest
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        release-1.12.1
)
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# Fetch additional modules here
# ...


# Add boost
# find_package(Boost 1.67.0 REQUIRED)
# include_directories(${Boost_INCLUDE_DIRS})\

# Add SDL2
# find_package(SDL2 REQUIRED)
# include_directories(${SDL2_INCLUDE_DIRS})


add_subdirectory(src)
add_subdirectory(apps)

# Add tests only from root
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    add_subdirectory(tests)
endif()
