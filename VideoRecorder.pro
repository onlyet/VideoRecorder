#-------------------------------------------------
#
# Project created by QtCreator 2015-04-01T17:15:51
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

UI_DIR  = obj/Gui
MOC_DIR = obj/Moc
OBJECTS_DIR = obj/Obj


#������ļ�ֱ�ӷŵ�Դ��Ŀ¼�µ�binĿ¼�£���dll�������˴�Ŀ¼�У����Խ�����к��Ҳ���dll����
#DESTDIR=$$PWD/bin/
contains(QT_ARCH, i386) {
    message("32-bit")
    DESTDIR = $${PWD}/bin32
} else {
    message("64-bit")
    DESTDIR = $${PWD}/bin64
}
QMAKE_CXXFLAGS += -std=c++11


TARGET = VideoRecorder
TEMPLATE = app

SOURCES += src/main.cpp\
        src/mainwindow.cpp \
    src/video/savevideofile.cpp \
    src/video/screenrecorder.cpp \
    src/widget/selectrect.cpp \
    src/widget/pushpoint.cpp \
    src/video/getvideothread.cpp \
    src/AppConfig.cpp

HEADERS  += src/mainwindow.h \
    src/video/savevideofile.h \
    src/video/screenrecorder.h \
    src/widget/selectrect.h \
    src/widget/pushpoint.h \
    src/video/getvideothread.h \
    src/AppConfig.h

FORMS    += src/mainwindow.ui


win32{

    contains(QT_ARCH, i386) {
        message("32-bit")
        INCLUDEPATH += $$PWD/lib/win32/ffmpeg/include \
                       $$PWD/src

        LIBS += -L$$PWD/lib/win32/ffmpeg/lib -lavcodec -lavdevice -lavfilter -lavformat -lavutil -lpostproc -lswresample -lswscale

    } else {
        message("64-bit")
        INCLUDEPATH += $$PWD/lib/win64/ffmpeg/include \
                       $$PWD/src

        LIBS += -L$$PWD/lib/win64/ffmpeg/lib -lavcodec -lavdevice -lavfilter -lavformat -lavutil -lpostproc -lswresample -lswscale

    }

}
