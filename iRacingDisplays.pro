QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        ir_connection.cpp \
        irsdk1.13/irsdk_client.cpp \
        irsdk1.13/irsdk_utils.cpp \
        irsdk1.13/yaml_parser.cpp \
        ir_real_time_data.cpp \
        ir_session_data.cpp \
        position_list.cpp \
        position_model.cpp \
        timer.cpp \
        ui_backend.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
  ir_connection.h \
  irsdk1.13/irsdk_client.h \
  irsdk1.13/irsdk_defines.h \
  irsdk1.13/yaml_parser.h \
  ir_display_common.h \
  ir_real_time_data.h \
  ir_session_data.h \
  position_list.h \
  position_model.h \
  timer.h \
  ui_backend.h

DISTFILES += \
  ui/InstrumentNeedle.qml \
  ui/PositionList.qml \
  ui/RpmMeter.qml \
  ui/SpeedoMeter.qml \
  ui/Top.qml \
  ui/WindSock.qml \
  ui/images/helmet.png \
  ui/images/skippy.png \
  ui/main.qml

LIBS += -lKernel32
