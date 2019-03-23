import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtQuick.Controls 2.5

Item {
    property alias sensorSetupPopup: sensorSetupPopup
    property int sensorId: 0
    Popup {
        id: sensorSetupPopup
        x: -400
        y: -235
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
                id: slotName
                width: 160
                x: (parent.width - width)/2
                placeholderText: "Sensor slot name"
            }
            Button{
                text: "Save"
                x: (parent.width - width)/2
                highlighted: true
                onClicked: {
                    controlnetApi.setSlotName(sensorId, slotName.text)
                }
            }
        }
    }
}

