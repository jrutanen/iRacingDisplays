#ifndef TIMER_H
#define TIMER_H

#include <QObject>
#include <QTimer>
#include "position_list.h"
#include "ui_backend.h"

#define ONE_SEC 1000

class Timer : public QObject
{
  Q_OBJECT
public:
  Timer(PositionList *positionList, UiBackend *backend);
  QTimer *timer;

signals:
  void timeOut();
};

#endif // TIMER_H
