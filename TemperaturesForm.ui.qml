import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3

Item {
    width: 243
    height: 400
    property alias temperatures: temperatures

    Pane {
        id: pane
        x: 0
        y: 0
        width: 243
        height: 400
        wheelEnabled: false

        Label {
            id: label
            x: 0
            y: 0
            text: qsTr("Temperatures")
            font.pointSize: 20
        }

        ListView {
            x: 0
            y: 39
            width: 243
            height: 340
            orientation: ListView.Horizontal
            clip: true
            spacing: 60
            leftMargin: 10
            model: ListModel {
                id: temperatures
                ListElement {
                    temperature: 22
                    slotName: "233333333"
                }
                ListElement {
                    temperature: 24
                    slotName: "233A33333"
                }
            }

            delegate: Column {
                Gauge {
                    height: 250
                    minimumValue: -20
                    maximumValue: 50
                    value: temperature
                }
                Label{
                    text: slotName
                    x: (parent.width - width)/2
                }
            }
        }
    }
}
