TEMPLATE = app

TARGET = functor

DESTDIR = ../../bin

win32 {

    OSG_LIB_DIRECTORY = $$(OSG_BIN_PATH)
    OSG_INCLUDE_DIRECTORY = $$(OSG_INCLUDE_PATH)
}

unix {

    LIB_DIRECTORY = /opt/osg/lib64
    OSG_INCLUDE_DIRECTORY = /opt/osg/include
}

CONFIG(debug, debug|release) {

    TARGET = $$join(TARGET,,,_d)

    LIBS += -L$$OSG_LIB_DIRECTORY -losgd
    LIBS += -L$$OSG_LIB_DIRECTORY -losgViewerd
    LIBS += -L$$OSG_LIB_DIRECTORY -losgDBd
    LIBS += -L$$OSG_LIB_DIRECTORY -lOpenThreadsd
    LIBS += -L$$OSG_LIB_DIRECTORY -losgUtild

} else {

    LIBS += -L$$OSG_LIB_DIRECTORY -losg
    LIBS += -L$$OSG_LIB_DIRECTORY -losgViewer
    LIBS += -L$$OSG_LIB_DIRECTORY -losgDB
    LIBS += -L$$OSG_LIB_DIRECTORY -lOpenThreads
    LIBS += -L$$OSG_LIB_DIRECTORY -losgUtil

}

INCLUDEPATH += $$OSG_INCLUDE_DIRECTORY

INCLUDEPATH += ./include

HEADERS += $$files(./include/*.h)
SOURCES += $$files(./src/*.cpp)
