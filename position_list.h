#ifndef IR_POSITIONS_H
#define IR_POSITIONS_H

#include <QObject>
#include <QVector>
#include "ir_display_common.h"
#include "ir_real_time_data.h"

class PositionList : public QObject
{
  Q_OBJECT

public:
  explicit PositionList(QObject *parent = nullptr);
  QVector<PositionItem> items() const;
  bool updatePositions(const PositionList &position);
  void setRealTimeDataObject(IrRealTimeData *realTimeData);

signals:
  void postPositionsUpdated(PositionList *list);

public slots:
  void updatePositions();

private:
  QVector<PositionItem> mList;
  IrRealTimeData *realTimeData;
};

#endif // IR_POSITIONS_H
