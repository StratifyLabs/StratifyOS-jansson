


#Add sources to the project
set(SOURCES_PREFIX ${CMAKE_SOURCE_DIR}/jansson/src)

set(SOURCES
    ${SOURCES_PREFIX}/dump.c
    ${SOURCES_PREFIX}/error.c
    ${SOURCES_PREFIX}/hashtable.c
    ${SOURCES_PREFIX}/hashtable_seed.c
    ${SOURCES_PREFIX}/load.c
    ${SOURCES_PREFIX}/memory.c
    ${SOURCES_PREFIX}/pack_unpack.c
    ${SOURCES_PREFIX}/strbuffer.c
    ${SOURCES_PREFIX}/strconv.c
    ${SOURCES_PREFIX}/utf.c
    ${SOURCES_PREFIX}/value.c
    ${SOURCES_PREFIX}/hashtable.h
    ${SOURCES_PREFIX}/jansson.h
    ${SOURCES_PREFIX}/jansson_private.h
    ${SOURCES_PREFIX}/lookup3.h
    ${SOURCES_PREFIX}/strbuffer.h
    ${SOURCES_PREFIX}/utf.h
)


set(SOS_SOURCELIST
	${SOURCES}
	jansson_private_config.h
	jansson_config.h
	jansson_api.c
	jansson_api.h)

set(SOS_INCLUDE_DIRECTORIES ${CMAKE_SOURCE_DIR} ${SOURCES_PREFIX})
set(SOS_OPTION "")
set(SOS_CONFIG release)
set(SOS_ARCH link)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib.cmake)
