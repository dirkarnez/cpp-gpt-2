@REM run as Administrator
@echo off
cd /d %~dp0

set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64;^
%DOWNLOADS_DIR%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin;^
%DOWNLOADS_DIR%\cmake-3.26.1-windows-x86_64\bin;

@REM set PATH=^
@REM D:\Softwares\PortableGit\bin;^
@REM D:\Softwares\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64;^
@REM D:\Softwares\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin;^
@REM D:\Softwares\cmake-3.29.3-windows-x86_64\bin;

@REM -DSDL2_DIR="%DOWNLOADS_DIR_LINUX%/SDL-release-2.30.6-winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1/lib/cmake/SDL2" ^
@REM -DSDL2_image_DIR="%DOWNLOADS_DIR_LINUX%/SDL_image-release-2.8.2-winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1/lib/cmake/SDL2_image" ^
@REM -DZLIB_ROOT="%DOWNLOADS_DIR_LINUX%/zlib-v1.3.1-winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1" ^
@REM -DZLIB_USE_STATIC_LIBS=ON ^
@REM -Dlibpng16_ROOT="%DOWNLOADS_DIR_LINUX%/libpng-v1.6.43-winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1" ^

echo %PATH%
cmake.exe -G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Debug ^
-DCMAKE_EXE_LINKER_FLAGS="-static" ^
-Dggml_ROOT="%DOWNLOADS_DIR_LINUX%/ggml-cbb8d8cff851b2de6fde4904be492d39458837e1a-winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1" ^
-B./cmake-build &&^
cd cmake-build && ( cmake --build . && echo "Successful build" )  &&^
pause
