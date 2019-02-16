import QtQuick 2.4

SensorHubForm {
    property real receivedModuleId: -1

    temperatureChart.onClicked: {
       controller.passDataToChartView(receivedModuleId, "", "", 0)
       controlnetApi.stopRequesting()
       calendarPopup.open()
    }

    humidityChart.onClicked: {
        controller.passDataToChartView(receivedModuleId, "", "", 1)
        controlnetApi.stopRequesting()
        calendarPopup.open()
    }

    Connections {
        target: controller
        onPassedModuleId: {
            moduleNameLabel.text = moduleName
            receivedModuleId = (moduleId)
            controlnetApi.startHubReqeusting(moduleId)
        }
    }

    Connections {
        target: controlnetApi
        onHubReceived: {
            var jsonObject = JSON.parse(json)
            jsonObject.temperatures.forEach(parseTemperature)
            if(jsonObject.humidityMeasurements.length > 0){
                jsonObject.humidityMeasurements.forEach(parseHumidityMeasurements)
            }else{
                humidity.visible = false
                humidityChart.visible = false
            }
        }
    }

    function parseTemperature(item, index){
       temperatures.temperatures.set(index, item)
    }

    function parseHumidityMeasurements(item, index){
        humidity.humiditySensors.set(index, item)
    }

    function getSensorType(item){
        return item.sensorType
    }

    function distinct(value, index, self){
        return self.indexOf(value) === index
    }

    function setSensorsType(item, index){
        if (item === 'T'){
            sensorTypeModel.append('Temperature Sensor')
        }else if (item === 'H'){
            sensorTypeModel.append('Humidity Sensor')
        }
    }






}
