#include "ir_session_data.h"
#include <QDebug>

IrSessionData::IrSessionData()
{
  this->updateWeekendInfo();
}

QString IrSessionData::getTrackName()
{
  return this->trackName;
}

void IrSessionData::updateWeekendInfo()
{
  int counter = 10;
  while(counter > 0)
  {
    counter--;
    SetPriorityClass(GetCurrentProcess(), HIGH_PRIORITY_CLASS);
    if (irsdkClient::instance().waitForData(16))
    {
      if (this->trackName == "")
      {
        if(1 == irsdkClient::instance().getSessionStrVal("WeekendInfo:TrackDisplayName:", tstr, MAX_STR))
        {
          this->trackName = tstr;
        }
      }

      if (this->trackLength == 0.0f)
      {
        //Get track length
        if(1 == irsdkClient::instance().getSessionStrVal("WeekendInfo:TrackLength:", tstr, MAX_STR))
        {
          this->trackLength = atof(tstr);
        }
      }
    }
  }
}
