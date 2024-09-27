#pragma once

#include <QAbstractListModel>
#include <QList>
#include <QString>

class CommentModel : public QAbstractListModel
{
    Q_OBJECT

public:
    enum Roles { CommentRole = Qt::UserRole + 1 }; // 只保留评论角色

    CommentModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addComment(const QString &comment); // 添加评论的方法

private:
    QList<QString> comments; // 存储评论的列表
};
