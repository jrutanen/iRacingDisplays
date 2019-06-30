#ifndef IR_DISPLAY_COMMON_H
#define IR_DISPLAY_COMMON_H

#include <QString>

#define PRACTICE 0
#define QUALIFY 1
#define RACE 2
#define MAX_DRIVERS 64

enum IRacingState {
  offline,
  online
};

enum Skies {
  clear,
  partlyCloudy,
  mostlyCloudy,
  overcast
};

struct Weather {
  bool dynamic;
  int sky;
  float airTemperature;
  float trackTemperature;
  float humidity;
  float windDirection;
  float windSpeed; //in knots
};

struct PositionItem
{
  int position;
  QString name;
  QString time;
  int carIdx;
  int lap;
  int change;
};

struct LapInfo {
 uint currentLap;
 uint totalLaps;
};
#endif // IR_DISPLAY_COMMON_H
