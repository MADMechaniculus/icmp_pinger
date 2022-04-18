CONFIG -= qt

TEMPLATE = lib
DEFINES += ICMP_PINGER_LIBRARY

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    pinger.cpp

HEADERS += \
    icmp_pinger_global.h \
    pinger.h \
    icmp_header.hpp \
    ipv4_header.hpp

# LIBS, INCLUDEPATH WIN32 =======================================

win32 {
INCLUDEPATH += \
        "C:\\include" \
        "C:\\include\\niistt_libs" \
        "C:\\include\\boost_1_76_0"

LIBS += \
        -L"C:\\libs" \
        -L"C:\\libs\\niistt_libs" \
        -L"C:\\libs\\libboost_1.76.0" \
        -L"C:\\libs\\boost_1.76.0" \
        -llibboost_system-mgw7-mt-x32-1_76 \
        -llibboost_thread-mgw7-mt-x32-1_76 \
        -llibboost_date_time-mgw7-mt-x32-1_76 \
        -llibboost_json-mgw7-mt-x32-1_76 \
        -llibboost_chrono-mgw7-mt-x32-1_76 \
        -llibboost_atomic-mgw7-mt-x32-1_76 \
        -lpthread
}

# ===============================================================

# LIBS, INCLUDEPATH UNIX ========================================

unix {
INCLUDEPATH += \
        "/usr/include/boostlibs/boost_1_76_0"

LIBS += \
        -L"/usr/lib/boost/1_76_0" \
        -lboost_system \
        -lboost_thread \
        -lboost_date_time \
        -lboost_json \
        -lboost_chrono \
        -lpthread
}

# ===============================================================

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    CMakeLists.txt
