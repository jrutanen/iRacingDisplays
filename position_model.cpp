#include "position_model.h"
#include "ir_real_time_data.h"
#include "position_list.h"
#include <QDebug>

PositionModel::PositionModel(QObject *parent)
  : QAbstractListModel(parent)
  , mList(nullptr)
{

}

int PositionModel::rowCount(const QModelIndex &parent) const
{
  // For list models only the root node (an invalid parent) should return the list's size. For all
  // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
  if (parent.isValid() || !mList)
  {
    return 0;
  }

  return mList->items().size();
}

QVariant PositionModel::data(const QModelIndex &index, int role) const
{
  if (!index.isValid() || !mList)
  {
    return QVariant();
  }

  const PositionItem item = mList->items().at(index.row());
  switch(role)
  {
  case PositionRole:
    return QVariant(item.position);
  case NameRole:
    return QVariant(item.name);
  case TimeRole:
    return QVariant(item.time);
  case ChangeRole:
    return QVariant(item.change);
  }
  return QVariant();
}

QHash<int, QByteArray> PositionModel::roleNames() const
{
  QHash<int, QByteArray> names;
  names[PositionRole] = "position";
  names[NameRole] = "name";
  names[TimeRole] = "time";
  names[ChangeRole] = "change";

  return names;
}

PositionList *PositionModel::list() const
{
  return mList;
}

void PositionModel::setList(PositionList *list)
{
  beginResetModel();

  if(mList)
  {
    mList->disconnect(this);
  }

  mList = list;

  if (mList)
  {
    connect(mList, &PositionList::postPositionsUpdated, this, [=](PositionList *list)
    {
      beginResetModel();
      mList = list;
      int index = mList->items().size();
      if(index > 0)
      {
        index--;
      }
      beginInsertRows(QModelIndex(), 0, index);
      endInsertRows();
      endResetModel();
    });
  }
  endResetModel();
}
