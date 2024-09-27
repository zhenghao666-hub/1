import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Window
import CommentModels 1.0

ApplicationWindow {
    width: 600
    height: 480
    visible: true
    title: qsTr("Video Player")
    id: rootWindow

    CommentModel {
        id: commentModel
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action: actions.open }
            MenuItem { action: actions.exit }
        }
    }
    header: ToolBar {
        RowLayout {
            ToolButton { action: actions.open }
        }
    }

    Actions {
        id: actions
        open.onTriggered: content.dialogs.openfile.open()
    }

    RowLayout { // 使用 RowLayout 来使内容和评论并排显示
        anchors.fill: parent
        spacing: 0

        ColumnLayout { // 左侧内容区域
            id: contentColumn
            anchors.fill: parent
            spacing: 0

            Content {
                id: content
                anchors.fill: parent

                // 视频显示区域
                ListView {
                    id: commentView
                    anchors.fill: parent
                    model: commentModel
                    delegate: CommentDelegate {} // 自定义的代理用于显示弹幕
                }

                List {
                    id: playerlist
                    visible: false
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                }
            }

            Footer {
                id: footer
            }
        }

    }
}
