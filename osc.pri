QT += qml quick

INCLUDEPATH += $$PWD

SOURCES += \
	$$PWD/osc_sender.cpp \
	$$PWD/osc_receiver.cpp

HEADERS += \
	$$PWD/osc_sender.h \
	$$PWD/osc_receiver.h

win32 {
	QMAKE_CXXFLAGS += /std:c++14
	QMAKE_LIBS += -lws2_32 -lwinmm
}else{
	QMAKE_CXXFLAGS += -std=c++11
}

exists( $$PWD/oscpack/liboscpack.* ) {
	QMAKE_LIBDIR += $$PWD/oscpack
}
win32 {
	CONFIG(release, debug|release) {
		message( "looking for release version of oscpack" )
		exists( $$PWD/oscpack/Release/oscpack.lib ) {
			QMAKE_LIBDIR += $$PWD/oscpack/Release
		}
	}
	CONFIG(debug, debug|release) {
		message( "looking for debug version of oscpack" )
		exists( $$PWD/oscpack/Debug/oscpack.lib ) {
			QMAKE_LIBDIR += $$PWD/oscpack/Debug
		}
	}
}

QMAKE_LIBS   += -loscpack

OTHER_FILES = qmldir
