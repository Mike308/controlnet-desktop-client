import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4

Item {
    width: 1120
    height: 720
    property alias temperatures: temperatures
    property alias moduleNameLabel: moduleNameLabel
    Pane {
        width: parent.width
        height: parent.height

        Label {
            id: moduleNameLabel
            x: 0
            y: 0
            text: qsTr("moduleName")
            font.pointSize: 42
        }

        Temperatures {
            id: temperatures
            x: -12
            y: 74
        }









    }
}
