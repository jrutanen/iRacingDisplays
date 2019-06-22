#include "timer.h"
#include <QDebug>

Timer::Timer(PositionList *positionList, UiBackend *backend)
{
  timer = new QTimer(this);

  connect(timer, SIGNAL(timeout()), positionList, SLOT(updatePositions()));
  connect(timer, SIGNAL(timeout()), backend, SLOT(setData()));

  timer->start(ONE_SEC);
}
