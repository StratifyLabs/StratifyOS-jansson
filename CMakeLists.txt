cmake_minimum_required (VERSION 3.6)


if( ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Darwin" )
  message(STATUS "Load Darwin Toolchain for arm")
  set(SOS_TOOLCHAIN_CMAKE_PATH /Applications/StratifyLabs-SDK/Tools/gcc/arm-none-eabi/cmake)
endif()
if( ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Windows" )
  message(STATUS "Load Windows Toolchain for arm")
  set(SOS_TOOLCHAIN_CMAKE_PATH C:/StratifyLabs-SDK/Tools/gcc/arm-none-eabi/cmake)
endif()

include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-resolve-build-config.cmake)

if( ${SOS_BUILD_CONFIG} STREQUAL arm )
  message(STATUS "Load SOS Lib Toolchain for arm: " ${SOS_TOOLCHAIN_CMAKE_PATH})
  set(CMAKE_TOOLCHAIN_FILE ${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-toolchain.cmake)
elseif( ${SOS_BUILD_CONFIG} STREQUAL link )
  set(CMAKE_TOOLCHAIN_FILE ${SOS_TOOLCHAIN_CMAKE_PATH}/link-toolchain.cmake)
endif()


set(SOS_LIB_DEFINITIONS -DHAVE_CONFIG_H=1)

set(SOS_LIB_NAME jansson)
project(${SOS_LIB_NAME} CXX C ASM)

set(SOS_LIB_INCLUDE_DIRECTORIES jansson/src)

install(FILES ./jansson/src/jansson.h ./jansson_api.h ./jansson_config.h DESTINATION include/jansson)

include( ${CMAKE_SOURCE_DIR}/${SOS_BUILD_CONFIG}.cmake )
