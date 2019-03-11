import QtQuick 2.4
import QtQuick 2.4
import QtQuick.Controls 2.5
import QtCharts 2.3

Item {
    width: 1120
    height: 720
    property alias button: button
    property alias startDateLabel: startDateLabel
    property alias chartView: chartView
    property alias xDateAxis: xDateAxis

    Pane {
        width: parent.width
        height: parent.height

        Label {
            id: startDateLabel
            text: ""
        }

        DateTimeAxis {
            id: xDateAxis
        }

        ChartView {
            id: chartView
            theme: ChartView.ChartThemeDark
            width: 1120
            height: 500
        }

        Button {
            id: button
            x: 45
            y: 546
            text: qsTr("Button")
            highlighted: true
        }
    }
}
