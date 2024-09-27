import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtMultimedia
import QtCore

Item {
    property alias openfile:_openfile

    FileDialog {
        id: _openfile
        title: "Select some Video files"
        currentFolder: StandardPaths.writableLocation(StandardPaths.VideoLocation)
        fileMode: FileDialog.OpenFiles
        nameFilters: [ "Video files (*.mkv *.mp4 *.avi)" ]
    }
}





