import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtQuick.Controls 2.5
ApplicationWindow {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Controlnet client")
    property real moduleIdReceived: -1
    property real measurementTypeReceived: -1

    RowLayout {
        width: parent.width
        height: parent.height
        spacing: 1
        ListView {
            id: listView
            width: 160
            height: 720
            highlight: Rectangle {color: Material.color(Material.Orange)}
            model: ListModel {id: modules}
            delegate: ItemDelegate {
                id: listItem
                width: 160
                text: qsTr(name)
                highlighted: true
                onClicked: displayDashBoard(id, name, index)
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
                    text: "2018-11-18 10:00"
                    placeholderText: "Begining date"
                }
                TextField {
                    id: endDateField
                    width: 160
                    x: (parent.width - width)/2
                    inputMask: "9999-99-99 99:99"
                    placeholderText: "Ending date"
                    text: "2018-11-18 12:00"
                }

                Button{
                    text: "Show"
                    highlighted: true
                    onClicked: {
                        if (measurementTypeReceived == 0){
                            stackView.replace("qrc:/ChartView.qml", StackView.Immediate)
                        }else if (measurementTypeReceived == 1){
                            stackView.replace("qrc:/HumidityChartView.qml", StackView.Immediate)
                        }else if (measurementTypeReceived == 2){
                            stackView.replace("qrc:/LxChartView.qml", StackView.Immediate)
                        }
                        calendarPopup.close()
                        controller.passDataToChartView(moduleIdReceived, startDateField.text, endDateField.text, -1)
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        controlnetApi.getAllModules()
        listView.currentIndex = -1
    }

    Component.onDestruction: {
        //controlnetApi.clearAll();
    }

    Connections {
        target: controller
        onPassedQMLFileName: {
            stackView.replace(file, StackView.Immediate)
        }

        onPassedDataToChartView: {
            moduleIdReceived = moduleId
            measurementTypeReceived = measurementType
        }
    }

    Connections {
        target: controlnetApi
        onModulesReceived: {
            console.log(json)
            var jsonObject = JSON.parse(json)
            jsonObject.forEach(setModules)
        }

    }

    function setModules(item, index){
        modules.set(index, item)
    }

    function displayDashBoard(moduleId, moduleName, index){
        listView.currentIndex = index
        stackView.replace("qrc:/SensorHub.qml", StackView.Immediate)
        controller.passModuleId(moduleId, moduleName)
        controlnetApi.getSensorsOfModule(moduleId)
    }






}
