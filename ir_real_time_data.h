#ifndef RACER_POSITIONS_H
#define RACER_POSITIONS_H
#include <QObject>
#include <QVector>
#include "irsdk1.13/irsdk_client.h"		// live telemetry
#include "ir_display_common.h"

class IrRealTimeData
{
public:
  IrRealTimeData();
  QVector<PositionItem> getPositions();
  void updateRaceData();
  float getCurrentSpeed();
  uint getCurrentRpm();
  LapInfo getLapInfo();

private:
  const int MAX_STR = 1024;
  const float MS_TO_KNOT_DIVISOR = 1.944f;
  char tstr[1024];
  char pathStr[1024];
  float speed;
  uint rpm;
  uint currentLap;
  uint totalLaps;
  QVector<PositionItem> positions;
  Weather weather;
  int carCount = 0;
  bool weathedDataUpdated;
  QString getDriverName(int carIdx);
  QString timeToString(float timeInSec);
  int nrOfElements(int idx);
  float kilometersPerHour(float metersPerSecond);
  void sortPositions();
  static bool compareByPosition(const PositionItem &a, const PositionItem &b);
  QString windows1252toQString(char* windows1252str);
};

#endif // RACER_POSITIONS_H
