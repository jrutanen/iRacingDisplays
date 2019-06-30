#include "ir_connection.h"

IrConnection::IrConnection()
{
  this->connect();
}

bool IrConnection::IsOnline()
{
  return irsdk_isConnected();
}

bool IrConnection::connect()
{

  bool connected = irsdk_startup();

  this->connectionStatus = connected ? online : offline;

  return connected;
}
