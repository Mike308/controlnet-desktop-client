import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.0

Item {
    width: 400
    height: 400
    property alias humiditySensors: humiditySensors
    Pane {
        id: pane
        x: 0
        y: 0
        width: 400
        height: 400

        ListView {
            x: 0
            y: 39
            width: 350
            height: 350
            orientation: ListView.Horizontal
            model: ListModel {
                id: humiditySensors
            }
            delegate: WaterProgress {
                id: waterProgress
                width: 200
                height: 200
                value: humidity
                to: 100
                textColor: "#ffffff"
                lineWidth: 25
                from: 0
                fontSize: 6
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onDoubleClicked: openPopup(sensorId)

                }
            }
        }

        Label {
            id: label
            x: 0
            y: 0
            text: qsTr("Humidity")
            font.pointSize: 20
        }
    }

    SensorSetup {
        id: sensorSetup
        x: 400
        y: 235
    }

    function openPopup(sensorId){
        sensorSetup.sensorId = sensorId
        sensorSetup.sensorSetupPopup.open()
        console.log("Mock: "+sensorId)
    }
}
