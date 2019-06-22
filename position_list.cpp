#include "position_list.h"
#include <QDebug>

PositionList::PositionList(QObject *parent) : QObject(parent)
{

}

QVector<PositionItem> PositionList::items() const
{
  return mList;
}

bool PositionList::updatePositions(const PositionList &item)
{
  return true;
}

void PositionList::setRealTimeDataObject(IrRealTimeData *realTimeData)
{
  this->realTimeData = realTimeData;
}

void PositionList::updatePositions()
{
  mList = realTimeData->getPositions();
  emit postPositionsUpdated(this);
}
