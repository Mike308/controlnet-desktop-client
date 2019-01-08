import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Controlnet client")


    RowLayout {
        width: parent.width
        height: parent.height
        spacing: 1
        ListView {
            id: listView
            width: 160
            height: 720
            model: NavBarModel{}
            delegate: ItemDelegate {
                width: 160
                text: qsTr(name)
                highlighted: true
                onClicked: pageLoader.setSource("Page1.qml")
            }
        }

        Rectangle {
            width: 1120
            height: 720
            color: "#1b1b1b"
            Loader {
                width: 1120
                height: 720
                id: pageLoader
                onLoaded: console.log("Test: "+source)
                onStatusChanged: if (pageLoader.status == Loader.Error) console.error("Error")
            }
        }
    }
}
