#include "ui_backend.h"
#include "ui_backend.h"
#include <QDebug>

UiBackend::UiBackend(QObject *parent) : QObject(parent)
{

}

void UiBackend::setRealTimeDataObject(IrRealTimeData *realTimeData)
{
  this->realTimeData = realTimeData;
}

void UiBackend::setData()
{
  setSpeed();
  setRpm();
  setLapInfo();
}

void UiBackend::setSpeed()
{
  float speed = realTimeData->getCurrentSpeed();
  emit speedChanged(QVariant(speed));
}

void UiBackend::setRpm()
{
  uint rpm = realTimeData->getCurrentRpm();
  emit rpmChanged(QVariant(rpm));

}

void UiBackend::setLapInfo()
{
  LapInfo info = realTimeData->getLapInfo();
  emit lapChanged(info.currentLap, info.totalLaps);
}

void UiBackend::setWeather()
{

}

void UiBackend::setSession()
{

}
