# Add executable
add_executable(main main.cpp)
target_compile_features(main PRIVATE cxx_std_20)

pico_set_program_name(main "main")
pico_set_program_version(main "0.1")

pico_enable_stdio_usb(main 0)
pico_enable_stdio_uart(main 0)

# Add the standard library to the build
target_link_libraries(main
        pico_stdlib
        pico_unique_id
        # tinyusb_device
        # tinyusb_board
        exLibrary)

# Add the standard include files to the build
target_include_directories(main PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}
  ${CMAKE_CURRENT_LIST_DIR}/..
)

pico_add_extra_outputs(main)
