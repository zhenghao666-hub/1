import QtQuick
import QtQuick.Controls


Item {
    property alias open: _open
    property alias pause: _pause
    property alias back: _back
    property alias forward: _forward
    property alias exit: _exit
    property alias voice: _voice

    Action {
        id: _open
        text: qsTr("&OpenFile...")
        icon.name: "document-open"
        shortcut: "StandardKey.Open"
    }

    Action {
        id: _save
        text: qsTr("&Save")
        shortcut: StandardKey.Save
        icon.name: "document-save"
    }

    Action {
        id: _voice
        icon.source:"qrc:/images/video"
    }



    Action {
        id: _back
        icon.source: "qrc:/images/back"

    }

    Action {
        id: _pause
        icon.source: "qrc:/images/pause"

    }
    Action {
        id: _forward
        icon.source: "qrc:/images/forward"
    }

    Action {
        id: _exit
        text: qsTr("E&xit")
        icon.name: "application-exit"
        shortcut: "Ctrl+q"
        onTriggered: Qt.quit();
    }
}

