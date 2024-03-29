#ifndef UI_BACKEND_H
#define UI_BACKEND_H

#include <QObject>
#include <QVariant>
#include "ir_display_common.h"
#include "ir_real_time_data.h"
#include "ir_connection.h"

class UiBackend : public QObject
{
  Q_OBJECT
public:
  explicit UiBackend(QObject *parent = nullptr);
  void setRealTimeDataObject(IrRealTimeData *realTimeData);
  void setIrConnectionObject(IrConnection *connection);

signals:
  void connected();
  void disconnected();
//  void trottleChanged(QVariant throttle);
  void speedChanged(QVariant speed);
  void rpmChanged(QVariant rpm);
  void lapChanged(QVariant currentLap, QVariant totalLaps);
//  void weatherChanged();
//  void sessionChanged();

public slots:
  void setData();

private:
  IrConnection *connection;
  IrRealTimeData *realTimeData;
  void setSpeed();
  void setRpm();
  void setWeather();
  void setSession();
  void setLapInfo();

};

#endif // UI_BACKEND_H
