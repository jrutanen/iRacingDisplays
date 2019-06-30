#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <stdio.h>
#include <string.h>
#include <QDebug>
#include <QTimer>
#include <assert.h>
#include <vector>
#include <windows.h>
#include <QQmlContext>
#include <QQuickWindow>

#include "ir_connection.h"
#include "ir_session_data.h"
#include "ir_display_common.h"
#include "ir_real_time_data.h"
#include "position_list.h"
#include "position_model.h"
#include "ui_backend.h"
#include "timer.h"

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  qmlRegisterType<PositionModel>("Position", 1, 0, "PositionModel");
  qmlRegisterType<UiBackend>("UiBackend", 1, 0, "UiBackend");
  qmlRegisterUncreatableType<PositionList>("Position", 1, 0, "PositionList",
    QStringLiteral("PositionList should not be created in QML"));

  //instanciate objects
  IrConnection connection;
  PositionList positionList;
  UiBackend uiBackend;
  IrRealTimeData realTimeData;
  uiBackend.setIrConnectionObject(&connection);
  uiBackend.setRealTimeDataObject(&realTimeData);
  positionList.setRealTimeDataObject(&realTimeData);

  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/ui/main.qml"));
  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                   &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
      QCoreApplication::exit(-1);
  }, Qt::QueuedConnection);
  engine.rootContext()->setContextProperty(QStringLiteral("positionList"), &positionList);
  engine.load(url);

  QObject *topLevel = engine.rootObjects().value(0);

//  QObject *speedNeedle = qobject_cast<QObject*>(topLevel->findChild<QObject*>("SpeedoMeterNeedle"));
//  QObject::connect(&uiBackend, SIGNAL(speedChanged(QVariant)),
//                   speedNeedle, SLOT(speedChanged(QVariant)));

//  QObject *rpmNeedle = qobject_cast<QObject*>(topLevel->findChild<QObject*>("RpmMeterNeedle"));
//  QObject::connect(&uiBackend, SIGNAL(rpmChanged(QVariant)),
//                   rpmNeedle, SLOT(rpmChanged(QVariant)));

  QObject *lapInfo = qobject_cast<QObject*>(topLevel->findChild<QObject*>("LapInfo"));
  QObject::connect(&uiBackend, SIGNAL(lapChanged(QVariant, QVariant)),
                   lapInfo, SLOT(lapChanged(QVariant, QVariant)));

  QObject *waitSpinner = qobject_cast<QObject*>(topLevel->findChild<QObject*>("WaitSpinner"));
  QObject::connect(&uiBackend, SIGNAL(connected()),
                   waitSpinner, SLOT(connected()));
  QObject::connect(&uiBackend, SIGNAL(disconnected()),
                   waitSpinner, SLOT(disconnected()));

//  qInfo() << "Object name: " << speedNeedle->objectName();
//  qInfo() << "Object name: " << rpmNeedle->objectName();
//  qInfo() << "Object name: " << lapInfo->objectName();


  //Start timer that will control the updates
  Timer timer(&positionList, &uiBackend);
  QQuickWindow::setDefaultAlphaBuffer(true);
  return app.exec();
}
