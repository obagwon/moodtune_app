cmake_minimum_required(VERSION 3.14)
project(moodtune_app LANGUAGES CXX)

set(BINARY_NAME "moodtune_app")

cmake_policy(VERSION 3.14...3.25)

set(CMAKE_INSTALL_PREFIX "${PROJECT_BINARY_DIR}/bundle" CACHE PATH "" FORCE)

function(APPLY_STANDARD_SETTINGS TARGET)
  target_compile_features(${TARGET} PUBLIC cxx_std_17)
  target_compile_options(${TARGET} PRIVATE /W4 /WX /wd"4100")
  target_compile_options(${TARGET} PRIVATE /EHsc)
  target_compile_definitions(${TARGET} PRIVATE "_HAS_EXCEPTIONS=0")
  target_compile_definitions(${TARGET} PRIVATE "$<$<CONFIG:Debug>:_DEBUG>")
endfunction()

add_compile_definitions(NOMINMAX)

set(FLUTTER_MANAGED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/flutter")
set(INSTALL_BUNDLE_DATA_DIR "${CMAKE_INSTALL_PREFIX}/data")
set(INSTALL_BUNDLE_LIB_DIR "${CMAKE_INSTALL_PREFIX}")

add_subdirectory(${FLUTTER_MANAGED_DIR})
add_subdirectory("runner")

include(flutter/generated_plugins.cmake)

add_dependencies(${BINARY_NAME} flutter_assemble)
