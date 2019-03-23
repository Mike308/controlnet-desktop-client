import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3

Item {
    property real sensorId: 0
    width: 400
    height: 100
    property alias lightIntensityGauge: lightIntensityGauge
    Pane {

        width: parent.width
        height: parent.height

        Label {
            id: label
            x: 0
            y: 0
            text: qsTr("Light Intensity")
            font.pointSize: 20
        }

    }

    Gauge {
        id: lightIntensityGauge
        x: 8
        y: 52
        width: 384
        height: 40
        orientation: Qt.Horizontal
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onDoubleClicked: openPopup()
        }
    }

    function setValue(value){
        lightIntensityGauge.value = value
    }

    SensorSetup {
        id: sensorSetup
        x: 400
        y: 235
    }

    function openPopup(){
        sensorSetup.sensorId = sensorId
        sensorSetup.sensorSetupPopup.open()
        console.log("Mock: "+sensorId)
    }
}
