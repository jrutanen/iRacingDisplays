#ifndef IR_CONNECTION_H
#define IR_CONNECTION_H

#include "irsdk1.13/irsdk_defines.h"
#include "ir_display_common.h"

class IrConnection
{
public:
  IrConnection();
  bool IsOnline();

private:
  bool connect();
  IRacingState connectionStatus;
};

#endif // IR_CONNECTION_H
