import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import CommentModels 1.0

Rectangle {
    id: footer
    Layout.fillWidth: true
    height: 50
    anchors.bottom: parent.bottom
    color: "#C0D9D9"

    MediaPlayer {
        id: trackPlayer
        autoPlay: false
        audioOutput: AudioOutput {
            id: audioOutput
            volume: slider_voice.value / 100 // 将音量值从 0-100 转换为 0-1
        }
    }

    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            spacing: 10 // 添加间距以改善布局

            ToolButton { action: actions.back }
            ToolButton { action: actions.pause }
            ToolButton { action: actions.forward }

            Slider {
                id: slider
                width: parent.width
                Layout.fillWidth: true
                height: 25
                // 更新媒体播放进度
                onValueChanged: {
                    trackPlayer.position = slider.value; // 使用 position 属性更新播放进度
                }
            }

            ToolButton { action: actions.voice }

            Slider {
                id: slider_voice
                Layout.preferredWidth: parent.width / 10
                height: 25
                from: 0
                to: 100
                stepSize: 1
                value: 50 // 默认音量值

                // 处理音量变化
                onValueChanged: {
                    audioOutput.volume = slider_voice.value / 100; // 将值从 0-100 转换为 0-1
                }
            }

            TextField {
                id: inputField
                Layout.fillWidth: true
                placeholderText: "输入评论..." // 更改为更明确的占位符
            }

            Button {
                text: "评论"
                width: 100
                height: 20
                anchors.left: inputField.right
                onClicked: {
                    var text = inputField.text.trim(); // 去除前后空格
                    if (text.length > 0) { // 确保评论不为空
                        commentModel.addComment(text);
                        inputField.clear(); // 清空输入框
                    }
                }
            }
        }
    }
}
