import QtQuick
import QtMultimedia
import QtQuick.Dialogs
import QtQuick.Controls

Item {
    property alias dialogs: dialogs
    property alias player:mediaplayer
    property alias videoItem:_videoItem
    property url audioSource

    Dialogs{
        id:dialogs
        openfile.onAccepted:{
            audioSource=openfile.selectedFile
            playerlist.videoPath=audioSource
            player.play()
        }
    }

    Item{
        id:_videoItem
        anchors.fill: parent
        focus:true
        MediaPlayer{
            id:mediaplayer
            source:audioSource
            audioOutput: AudioOutput{}
            videoOutput: videoOutput
        }
        VideoOutput{
            id:videoOutput
            anchors.fill:parent
            fillMode: VideoOutput.PreserveAspectFit
        }
    }



}

