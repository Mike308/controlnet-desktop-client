import QtQuick 2.4
import QtQuick.Controls 2.5
import QtCharts 2.3

Item {
    width: 1120
    height: 720
    property alias zoomOut: zoomOut
    property alias button: button
    property alias zoomIn: zoomIn
    property alias scrollLeft: scrollLeft
    property alias scrollRight: scrollRight
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
            width: 1120
            height: 500

            Button {
                id: button
                x: 96
                y: 562
                width: 50
                height: 50
                text: qsTr("*")
                highlighted: true
                autoRepeat: true
            }
        }

        Button {
            id: scrollRight
            x: 158
            y: 561
            width: 50
            height: 50
            text: qsTr("---->")
            highlighted: true
        }

        Button {
            id: scrollLeft
            x: 34
            y: 561
            width: 50
            height: 50
            text: qsTr("<----")
            highlighted: true
        }

        Button {
            id: zoomIn
            x: 95
            y: 507
            width: 50
            height: 50
            text: qsTr("+")
            highlighted: true
        }

        Button {
            id: zoomOut
            x: 95
            y: 615
            width: 50
            height: 50
            text: qsTr("-")
            highlighted: true
            autoRepeat: true
        }
    }
}
