cmake_minimum_required (VERSION 3.6)

#[[

cmake -P sos-git.cmake


]]#

if( ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Darwin" )
set(SOS_TOOLCHAIN_CMAKE_PATH /Applications/StratifyLabs-SDK/Tools/gcc/arm-none-eabi/cmake)
endif()
if( ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Windows" )
  set(SOS_TOOLCHAIN_CMAKE_PATH C:/StratifyLabs-SDK/Tools/gcc/arm-none-eabi/cmake)
endif()

include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-sdk.cmake)


#Pull or clone mbed-tls project
set(GIT_DIRECTORY ${CMAKE_SOURCE_DIR})
sos_sdk_clone_or_pull(${CMAKE_SOURCE_DIR}/${GIT_DIRECTORY} https://github.com/akheron/jansson.git ${GIT_DIRECTORY})
