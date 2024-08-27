cmake_minimum_required(VERSION 3.14)
project("ggml-helper")

add_library(ggml STATIC IMPORTED)

set_property(
  TARGET ggml APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE
)

set_target_properties(ggml PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${ggml_ROOT}/lib/libggml.a"
)
  
set_target_properties(ggml PROPERTIES
  MAP_IMPORTED_CONFIG_MINSIZEREL Release
  MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
)

target_include_directories(ggml INTERFACE "${ggml_ROOT}/include")

add_library(${PROJECT_NAME} STATIC
    "include/common-ggml.h"
    "src/common-ggml.cpp")

target_compile_features(${PROJECT_NAME}
    PRIVATE
        cxx_std_11
)

# SDL2::SDL2-statics
target_link_libraries(${PROJECT_NAME} PRIVATE ggml)

target_include_directories(${PROJECT_NAME}
    PUBLIC
    "include")