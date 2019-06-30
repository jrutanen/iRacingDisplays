#include <QDebug>
#include "ir_real_time_data.h"
#include "ir_display_common.h"
#include <algorithm>
//#include <Windows.h>
#include <stringapiset.h>

IrRealTimeData::IrRealTimeData()
{
  this->weathedDataUpdated = false;
}

QVector<PositionItem> IrRealTimeData::getPositions()
{
  this->updateRaceData();
  return this->positions;
}

QString IrRealTimeData::getDriverName(int carIdx)
{
  QString name = "";
  //Build search path
  sprintf(pathStr, "DriverInfo:Drivers:CarIdx:{%d}UserName:", carIdx);
  if(1 == irsdkClient::instance().getSessionStrVal(pathStr, tstr, MAX_STR))
  {
    name = windows1252toQString(tstr);
  }
  return name;
}

QString IrRealTimeData::timeToString(float timeInSec)
{
  QString timeString;
  int minutes = static_cast<int>(timeInSec / 60);
  float seconds = timeInSec - (60 * minutes);
  if (minutes == 0)
  {
    timeString.append("00:");
  }
  else {
    timeString.append("0");
    timeString.append(minutes);
    timeString.append(":");
  }
  if (seconds == 0)
  {
    timeString.append("00.000");
  }
  else
  {
    if (seconds < 10.0f)
    {
      timeString.append("0");
    }
    timeString.append(QString::number(seconds, 'f', 3));
  }
  return timeString;
}

LapInfo IrRealTimeData::getLapInfo()
{
  LapInfo info = {this->currentLap, this->totalLaps};
  return info;
}

void IrRealTimeData::updateRaceData()
{
  if(irsdkClient::instance().waitForData(16))
  {
    if (this->weather.dynamic | !this->weathedDataUpdated)
    {
      //get Weather
      weather.sky = irsdkClient::instance().getVarInt("Skies");
      weather.dynamic = irsdkClient::instance().getVarInt("WeatherType");
      weather.humidity = irsdkClient::instance().getVarFloat("RelativeHumidity");
      //windspeed in knots
      weather.windSpeed =
        (irsdkClient::instance().getVarFloat("WindVel"))/MS_TO_KNOT_DIVISOR;
      weather.windDirection = irsdkClient::instance().getVarFloat("WindDir");
      weather.airTemperature = irsdkClient::instance().getVarFloat("AirTemp");
      weather.trackTemperature = irsdkClient::instance().getVarFloat("TrackTemp");
    }
    //get lap info
    this->currentLap = static_cast<uint>(irsdkClient::instance().getVarInt("Lap"));
    int lapsRemaining = irsdkClient::instance().getVarInt("SessionLapsRemain");
    this->totalLaps = static_cast<uint>(lapsRemaining) + this->currentLap;
    if (this->totalLaps > 1000) this->totalLaps = 0;
    //get Speed
    float speedInKmH = this->kilometersPerHour(irsdkClient::instance().getVarFloat("Speed"));
    this->speed = speedInKmH;
    //get RPM
    float rpmF = irsdkClient::instance().getVarFloat("RPM");
    this->rpm = static_cast<uint>(rpmF);
    //get driver positions
    this->positions.clear();
    for (int i = 1; i < MAX_DRIVERS; i++)
    {
      int position = irsdkClient::instance().getVarInt("CarIdxPosition", i);
      if (position != 0)
      {
        PositionItem driver;
        int driverLap = irsdkClient::instance().getVarInt("CarIdxLap", i);
        float driverGap = irsdkClient::instance().getVarFloat("CarIdxF2Time", i);
        QString driverName = this->getDriverName(i);
        driver.position = position;
        driver.name = driverName;
        driver.lap = driverLap;
        driver.time = timeToString(driverGap);
        driver.carIdx = i;
        this->positions.append(driver);
      }
      else
      {
        this->carCount = i - 1;
        break;
      }
    }
    sortPositions();
  }
}

float IrRealTimeData::getCurrentSpeed()
{
  return this->speed;
}

uint IrRealTimeData::getCurrentRpm()
{
  return this->rpm;
}

int IrRealTimeData::nrOfElements(int idx)
{

  return irsdkClient::instance().getVarCount(idx);
}

float IrRealTimeData::kilometersPerHour(float metersPerSecond)
{
  float kmPerHour = 0.0;
  int meterInKm = 1000;
  int secsInHour = 60 * 60;
  kmPerHour = (metersPerSecond/meterInKm) * secsInHour;

  return kmPerHour;
}

void IrRealTimeData::sortPositions()
{
  std::sort(this->positions.begin(), this->positions.end(), compareByPosition);
}

bool IrRealTimeData::compareByPosition(const PositionItem &a, const PositionItem &b)
{
  return a.position < b.position;
}

QString IrRealTimeData::windows1252toQString(char *windows1252str)
{
  const uint WINDOWS_1252 = 1252;
  //Fetch number of characters in the array
  int nrOfCharacters = MultiByteToWideChar(
    WINDOWS_1252,
    MB_PRECOMPOSED,
    windows1252str,
    -1,
    nullptr,
    0
  );

  //Convert char array to widearray
  wchar_t* wideString = new wchar_t[nrOfCharacters];
  MultiByteToWideChar(
        WINDOWS_1252,
        MB_PRECOMPOSED,
        windows1252str,
        -1,
        wideString,
        nrOfCharacters
      );

  //Convert wide array to QString
  return QString::fromWCharArray(wideString);
}
