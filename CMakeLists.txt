cmake_minimum_required(VERSION 3.18)

set (CMAKE_CXX_STANDARD 11)

project("cpp-gpt-2")

add_subdirectory("common")
add_subdirectory("ggml-helper")
add_subdirectory("gpt-2")
add_subdirectory("app")