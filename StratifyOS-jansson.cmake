cmake_minimum_required (VERSION 3.6)

# cmake -P ./StratifyOS-jansson.cmake

if( ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Darwin" )
set(SOS_TOOLCHAIN_CMAKE_PATH /Applications/StratifyLabs-SDK/Tools/gcc/arm-none-eabi/cmake)
endif()
if( ${CMAKE_HOST_SYSTEM_NAME} STREQUAL "Windows" )
  set(SOS_TOOLCHAIN_CMAKE_PATH C:/StratifyLabs-SDK/Tools/gcc/arm-none-eabi/cmake)
endif()
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-sdk.cmake)

set(JANSSON_DIRECTORY ${CMAKE_SOURCE_DIR}/jansson)
if(EXISTS  ${JANSSON_DIRECTORY})
	message("jansson project has already been cloned -- delete to pull again")
else()
	sos_sdk_clone_or_pull(${JANSSON_DIRECTORY} https://github.com/akheron/jansson.git ./)
	sos_sdk_checkout(${JANSSON_DIRECTORY} "2.11")
endif()
