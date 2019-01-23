import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtQuick.Controls 2.2
import Qt.labs.calendar 1.0
ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Controlnet client")
    property string qmlFile: ""
    RowLayout {
        width: parent.width
        height: parent.height
        spacing: 1
        ListView {
            id: listView
            width: 160
            height: 720
            model: NavBarModel{id: navBarModel }
            delegate: ItemDelegate {
                width: 160
                text: qsTr(name)
                highlighted: true
                onClicked: stackView.replace(source, StackView.Immediate)
            }
        }

        StackView {
            id: stackView
            width: 1120
            height: 720
        }

        Popup {
            id: calendarPopup
            x: 480
            y: 235
            width: 320
            height: 250
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

            Column {
                id: column
                width: parent.width
                height: parent.height
                TextField {
                    id: startDateField
                    width: 160
                    x: (parent.width - width)/2
                    inputMask: "9999-99-99 99:99"
                    placeholderText: "Begining date"
                }
                TextField {
                    id: endDateField
                    width: 160
                    x: (parent.width - width)/2
                    inputMask: "9999-99-99 99:99"
                    placeholderText: "Ending date"
                }

                Button{
                    text: "Show"
                    onClicked: {
                        stackView.replace(qmlFile, StackView.Immediate)
                        calendarPopup.close()
                    }
                }

            }

        }

    }

    Connections {
        target: viewManager
        onPassedQMLFile: {
            qmlFile = file
        }
    }




}
