import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Component {
    Item {
        id: commentItem
        width: parent.width
        height: 50 // 可以根据需要调整初始高度

        ListView {
            id: commentListView
            width: 200 // 根据需要调整宽度
            anchors.right: parent.right // 将评论列表放在右侧
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            model: commentModel // 绑定到评论模型

            delegate: Item {
                width: commentListView.width // 确保每个评论项的宽度与列表一致
                height: Math.max(commentText.height, 50) // 根据文本高度调整评论项高度

                RowLayout {
                    anchors.fill: parent // 使用布局填充整个评论项

                    TextArea {
                        id: commentText
                        text: model.comment // 假设有一个名为'comment'的角色
                        Layout.fillWidth: true // 让 TextArea 填充剩余空间
                        font.pixelSize: 16 // 字体大小
                        color: "black" // 字体颜色
                        wrapMode: TextArea.Wrap // 自动换行
                        readOnly: true // 设置为只读
                    }

                    Button {
                        text: "删除" // 删除按钮
                        onClicked: {
                            commentModel.removeComment(model.index); // 调用模型中的删除方法
                        }
                    }
                }
            }
        }
    }
}
