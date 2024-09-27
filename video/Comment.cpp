#include "Comment.h"

CommentModel::CommentModel(QObject *parent)
    : QAbstractListModel(parent)
{}

int CommentModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return comments.count(); // 返回评论列表的大小
}

QVariant CommentModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= comments.count())
        return QVariant();

    switch (role) {
    case CommentRole:
        return comments.at(index.row());
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> CommentModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[CommentRole] = "comment"; // 修改为评论角色
    return roles;
}

void CommentModel::addComment(const QString &comment)
{
    if (comment.isEmpty())
        return; // 如果评论为空，直接返回

    beginInsertRows(QModelIndex(), comments.count(), comments.count());
    comments.append(comment);
    endInsertRows();
}

