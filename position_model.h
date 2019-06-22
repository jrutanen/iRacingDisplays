#ifndef PositionModel_H
#define PositionModel_H

#include <QAbstractListModel>

class PositionList;

class PositionModel : public QAbstractListModel
{
  Q_OBJECT
  Q_PROPERTY(PositionList *list READ list WRITE setList)

public:
  explicit PositionModel(QObject *parent = nullptr);

  enum
  {
    PositionRole = Qt::UserRole,
    NameRole,
    TimeRole,
    ChangeRole
  };

  // Basic functionality:
  int rowCount(const QModelIndex &parent = QModelIndex()) const override;

  QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

  virtual QHash<int, QByteArray> roleNames() const override;

  PositionList *list() const;
  void setList(PositionList *list);

private:
  PositionList *mList;
};

#endif // PositionModel_H
