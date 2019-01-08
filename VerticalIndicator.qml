import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    property real value: 10
    property string label: ""
    property string valueStr: qsTr(value)
    Column {
        spacing: 100
        ProgressBar {
            height: 50
            rotation: -90
            from: -20
            to: 50
            value: setValue
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Text {
                text: setValue
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                color: "white"
            }

            Text {
                text: name
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                color: "white"
            }
        }

    }
}
