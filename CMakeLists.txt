set(CMAKE_REQUIRED_VERSION 3.14)
cmake_minimum_required(VERSION ${CMAKE_REQUIRED_VERSION})


project(Template 
    LANGUAGES C CXX ASM
    VERSION 0.0.1
    DESCRIPTION "Template for Raspberry Pi Pico projects")

# Set global properties only in the root of the project
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    set(CMAKE_CXX_EXTENSIONS OFF)
    
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()


# Initialise pico_sdk from installed location
# set(PICO_SDK_PATH "/usr/lib/pico-sdk")
# Or fetch and install Pico SDK from git
set(PICO_SDK_FETCH_FROM_GIT on)

set(PICO_BOARD pico CACHE STRING "Board type")

include(pico_sdk_import.cmake)

if (PICO_SDK_VERSION_STRING VERSION_LESS "1.4.0")
  message(FATAL_ERROR "Raspberry Pi Pico SDK version 1.4.0 (or later) required. Your version is ${PICO_SDK_VERSION_STRING}")
endif()

add_compile_definitions(CFG_TUSB_CONFIG_FILE="KeyboardDriver/tusb_config.h")

pico_sdk_init()


add_subdirectory(apps)
add_subdirectory(src)
