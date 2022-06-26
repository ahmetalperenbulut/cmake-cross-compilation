# CMake Cross Compilation 

- You can cross-compile your projects using the external_toolchain.cmake file.

## Example usage

- cmake -DCROSS_COMPILER_PREFIX=arm-linux-gnueabi -DCROSS_COMPILER_ROOT=/usr/arm-linux-gnueabi -DCMAKE_TOOLCHAIN_FILE=external_toolchain.cmake -B./build . 
