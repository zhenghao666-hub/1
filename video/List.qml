import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: list
    width: 200
    height: 300
    color: "#C0D9D9"
    property var videoPath
    property var allPath: []

    signal playerList(string path, int listIndex)

    // 监听 videoPath 的变化并更新列表
    onVideoPathChanged: {
        listModel.append({"path": videoPath}); // 使用对象形式添加到模型
        allPath.push(videoPath);
    }

    clip: true

    ListView {
        id: listView
        anchors.fill: parent
        model: ListModel {
            id: listModel
        }

        // 重写
        delegate: listDelegate

        ScrollBar.vertical: ScrollBar {
            anchors.right: parent.right
        }

    }

    Component {
        id: listDelegate
        Rectangle {
            id: listDelegateRect
            height: 45
            width: listView.width
            color: "#C0D9D9"
            Text {
                text: model.path // 使用模型中的数据
                width: listDelegateRect.width - 10   // 设置宽度
                font.pointSize: 9
                color: "white"
            }
        }
    }

    function setListIndex(listCurIndex) {
        if (listCurIndex < 0)
            listCurIndex = listView.count - 1;
        else
            listCurIndex %= listModel.count;

        listView.currentIndex = listCurIndex;
        playerList(allPath[listCurIndex], listCurIndex); // 通知主界面改变了索引
        console.log("function currentIndex: " + listCurIndex);
    }
}
