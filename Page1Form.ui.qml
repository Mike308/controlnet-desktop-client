import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

Item {
    width: 1120
    height: 720
    property alias listView: listView
    visible: true
    Rectangle {
        width: parent.width
        height: parent.height
        color: "#1b1b1b"

        ListView {
            id: listView
            x: 23
            y: 138
            width: 1044
            height: 280
            orientation: ListView.Horizontal
            clip: true
            spacing: 80

            model: ListModel {
                ListElement {
                    name: "Grey"
                    setValue: 34
                }

                ListElement {
                    name: "Red"
                    setValue: 20
                }

                ListElement {
                    name: "Blue"
                    setValue: -15
                }

                ListElement {
                    name: "Green"
                    setValue: 10
                }

                ListElement {
                    name: "Grey"
                    setValue: 34
                }

                ListElement {
                    name: "Red"
                    setValue: 20
                }

                ListElement {
                    name: "Blue"
                    setValue: -15
                }

                ListElement {
                    name: "Green"
                    setValue: 10
                }

                ListElement {
                    name: "Grey"
                    setValue: 34
                }

                ListElement {
                    name: "Red"
                    setValue: 20
                }

                ListElement {
                    name: "Blue"
                    setValue: -15
                }

                ListElement {
                    name: "Green"
                    setValue: 10
                }

                ListElement {
                    name: "Grey"
                    setValue: 34
                }

                ListElement {
                    name: "Red"
                    setValue: 20
                }

                ListElement {
                    name: "Blue"
                    setValue: -15
                }

                ListElement {
                    name: "Green"
                    setValue: 10
                }

                ListElement {
                    name: "Green"
                    setValue: 10
                }

                ListElement {
                    name: "Grey"
                    setValue: 34
                }

                ListElement {
                    name: "Red"
                    setValue: 20
                }

                ListElement {
                    name: "Blue"
                    setValue: -15
                }

                ListElement {
                    name: "Green"
                    setValue: 10
                }
            }

            delegate:
                VerticalIndicator {
                value: setValue
                label: name
                valueStr: setValue
            }
        }

        Label {
            id: label
            x: 23
            y: 39
            text: qsTr("Temperatures")
            font.bold: true
            font.pointSize: 21
        }
    }

}
