import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4

Item {
    width: 1120
    height: 720
    property alias temperatures: temperatures
    property alias moduleNameLabel: moduleNameLabel
    property alias humidity: humidity
    property alias temperatureChart: temperatureChart
    property alias humidityChart: humidityChart

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
            width: 486
            height: 400
        }

        Humidity {
            id: humidity
            x: 624
            y: 74
            width: 368
            height: 316
        }

        Row {
            x: 0
            y: 447
            spacing: 10

            Button {
                id: temperatureChart
                text: qsTr("Temperature Chart")
                highlighted: true
            }

            Button {
                id: humidityChart
                text: qsTr("Humidity chart")
                highlighted: true
            }
        }
    }
}
