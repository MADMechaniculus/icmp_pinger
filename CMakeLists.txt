cmake_minimum_required(VERSION 3.10)

project(icmp_pinger)

set(headers icmp_header.hpp ipv4_header.hpp icmp_pinger_global.h pinger.h)
set(sources pinger.cpp)

add_library(${PROJECT_NAME} ${sources})

# Define boost variables
if (WIN32)
    set(BOOST_INCLUDEDIR        C:\\include\\boost_1_76_0)
    set(BOOST_LIBRARYDIR        C:\\libs\\boost_1.76.0)
elseif (UNIX)
    set(BOOST_INCLUDEDIR        /usr/include/boostlibs/boost_1_76_0)
    set(BOOST_LIBRARYDIR        /usr/lib/boost/1_76_0)
else ()
    message( FATAL_ERROR "Unknown OS!")
endif ()

# Link winsock libraries
if(WIN32)
  target_link_libraries(${PROJECT_NAME} wsock32 ws2_32)
endif()

# Add include and link dirs
target_include_directories(${PROJECT_NAME} PUBLIC ${BOOST_INCLUDEDIR} PRIVATE .)
target_link_directories(${PROJECT_NAME} PUBLIC ${BOOST_LIBRARYDIR})

# Find boost libs
find_package(Boost COMPONENTS system thread atomic REQUIRED)

# Find posix threads
find_package(Threads REQUIRED)

# Link boost libs
target_link_libraries(${PROJECT_NAME} ${Boost_LIBRARIES})
