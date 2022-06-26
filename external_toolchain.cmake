# Skip this file for internal CMAKE tests...
if (CMAKE_PROJECT_NAME STREQUAL "CMAKE_TRY_COMPILE")
    return()
endif()

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 4.4)
set(CMAKE_SYSTEM_PROCESSOR arm)

#https://cmake.org/cmake/help/latest/variable/CMAKE_TRY_COMPILE_TARGET_TYPE.html
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_COMPILER        ${CROSS_COMPILER_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER      ${CROSS_COMPILER_PREFIX}-g++)
set(CMAKE_STRIP             ${CROSS_COMPILER_PREFIX}-strip)
set(CMAKE_LINKER            ${CROSS_COMPILER_PREFIX}-ld)
set(CMAKE_AR                ${CROSS_COMPILER_PREFIX}-ar)
set(CMAKE_C_COMPILER_AR     ${CROSS_COMPILER_PREFIX}-ar)
set(CMAKE_RANLIB            ${CROSS_COMPILER_PREFIX}-ranlib)
set(CMAKE_ASM_COMPILER      ${CROSS_COMPILER_PREFIX}-as)
set(CMAKE_SIZE              ${CROSS_COMPILER_PREFIX}-size )

#This variable may be set to a path to install to when cross-compiling. This can be useful if the path in CMAKE_SYSROOT is read-only, or otherwise should remain pristine.
#set(CMAKE_STAGING_PREFIX /home/devel/stage)


# Target Environment
set(CMAKE_FIND_ROOT_PATH    ${CROSS_COMPILER_ROOT} CACHE INTERNAL "" FORCE)
#set(CMAKE_SYSROOT ${CROSS_COMPILER_ROOT})
set(ENV{PKG_CONFIG_PATH}   ${CROSS_COMPILER_ROOT}/usr/lib/pkgconfig CACHE INTERNAL "" FORCE)

set(CMAKE_INCLUDE_PATH                      "${CROSS_COMPILER_ROOT}/usr/include ${CROSS_COMPILER_ROOT}/include" CACHE INTERNAL "" FORCE)
set(CMAKE_LIBRARY_PATH                      "${CROSS_COMPILER_ROOT}/usr/lib ${CROSS_COMPILER_ROOT}/lib" CACHE INTERNAL "" FORCE)
set(CMAKE_C_IMPLICIT_LINK_DIRECTORIES       "${CMAKE_C_IMPLICIT_LINK_DIRECTORIES} ${CROSS_COMPILER_ROOT}/usr/lib ${CROSS_COMPILER_ROOT}/lib" CACHE INTERNAL "" FORCE)
set(CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES     "${CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES} ${CROSS_COMPILER_ROOT}/usr/lib ${CROSS_COMPILER_ROOT}/lib" CACHE INTERNAL "" FORCE)
set(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES    "${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES} ${CROSS_COMPILER_ROOT}/usr/include ${CROSS_COMPILER_ROOT}/include" CACHE INTERNAL "" FORCE)
set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES  "${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES} ${CROSS_COMPILER_ROOT}/usr/include ${CROSS_COMPILER_ROOT}/include" CACHE INTERNAL "" FORCE)

# Do not use files from system paths
set(NO_CMAKE_SYSTEM_PATH TRUE)

# search headers and libraries in the target environment

# This variable controls whether the CMAKE_FIND_ROOT_PATH and CMAKE_SYSROOT are used by find_program().
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# This variable controls whether the CMAKE_FIND_ROOT_PATH and CMAKE_SYSROOT are used by find_library().
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)

# This variable controls whether the CMAKE_FIND_ROOT_PATH and CMAKE_SYSROOT are used by find_file() and find_path().
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#This variable controls whether the CMAKE_FIND_ROOT_PATH and CMAKE_SYSROOT are used by find_package().
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

function(PrintAllVariables)
    get_cmake_property(_variableNames VARIABLES)
    list (SORT _variableNames)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
endfunction()

#PrintAllVariables()