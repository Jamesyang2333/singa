SET(Singa_LINKER_LIBS "")

INCLUDE("cmake/ProtoBuf.cmake")

IF(USE_LMDB)
    FIND_PACKAGE(LMDB REQUIRED)
    INCLUDE_DIRECTORIES(SYSTEM ${LMDB_INCLUDE_DIR})
    LIST(APPEND Singa_LINKER_LIBS ${LMDB_LIBRARIES})
ENDIF()

IF(NOT CPU_ONLY)
    INCLUDE("cmake/Cuda.cmake")
ELSE()
    SET(USE_CUDA FALSE)
    SET(USE_CUDNN FALSE)
ENDIF()


#LIST(APPEND SINGA_LINKER_LIBS "/home/wangwei/local/lib/libopenblas.so")
#MESSAGE(STATUS "link lib : " ${SINGA_LINKER_LIBS})
