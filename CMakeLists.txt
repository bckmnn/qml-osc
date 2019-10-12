cmake_minimum_required(VERSION 3.1.0)
PROJECT( OSC )

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 11)

if(CMAKE_VERSION VERSION_LESS "3.7.0")
    set(CMAKE_INCLUDE_CURRENT_DIR ON)
endif()

find_package(Qt5 COMPONENTS Core Qml Quick REQUIRED)

if(WIN32)
  set(LIBS debug ${CMAKE_SOURCE_DIR}/oscpack/Debug/oscpack.lib optimized ${CMAKE_SOURCE_DIR}/oscpack/Release/oscpack.lib Ws2_32 winmm ${LIBS})
endif()
if(APPLE)
  set(LIBS ${CMAKE_SOURCE_DIR}/oscpack/liboscpack.a ${LIBS})
endif()

set(SOURCES
${CMAKE_SOURCE_DIR}/osc_plugin.cpp
${CMAKE_SOURCE_DIR}/osc_sender.cpp
${CMAKE_SOURCE_DIR}/osc_receiver.cpp
${CMAKE_SOURCE_DIR}/osc_plugin.h
${CMAKE_SOURCE_DIR}/osc_sender.h
${CMAKE_SOURCE_DIR}/osc_receiver.h
)

add_library(osc SHARED ${SOURCES})
target_link_libraries(osc Qt5::Core Qt5::Qml Qt5::Quick ${LIBS} )


