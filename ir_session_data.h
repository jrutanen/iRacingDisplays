#ifndef IRDATA_H
#define IRDATA_H

#include <vector>
#include <windows.h>
#include "irsdk1.13/irsdk_client.h"		// live telemetry
#include "ir_display_common.h"

class IrSessionData
{
public:
  IrSessionData();
  QString getTrackName();
private:
  const int MAX_STR = 1024;
  char tstr[1024];
  char pathStr[1024];
  float trackLength = 0.0f;
  QString trackName;
  void updateWeekendInfo();
};

#endif // IRDATA_H
