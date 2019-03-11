import QtQuick 2.4

SensorHubForm {
    property real receivedModuleId: -1
    lxChart.onClicked: {
       controller.passDataToChartView(receivedModuleId, "", "", 2)
       controlnetApi.stopRequesting()
        calendarPopup.open()
    }

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
            jsonObject.humidityMeasurements.forEach(parseHumidityMeasurements)
            jsonObject.lightIntensityMeasurements.forEach(parseLightIntensityMeasurements)
            humidity.visible = jsonObject.humidityMeasurements.length > 0
            humidityChart.visible = jsonObject.humidityMeasurements.length > 0
            temperatureChart.visible = jsonObject.temperatures.length > 0
            temperatures.visible = jsonObject.temperatures.length > 0
            lightIntensity.visible = jsonObject.lightIntensityMeasurements.length > 0
            jsonObject.humidityMeasurements.forEach(parseHumidityMeasurements)
            jsonObject.lightIntensityMeasurements.forEach(parseLightIntensityMeasurements)
        }
    }

    function parseTemperature(item, index){
        temperatures.temperatures.set(index, item)
    }

    function parseHumidityMeasurements(item, index){
        humidity.humiditySensors.set(index, item)
    }

    function parseLightIntensityMeasurements(item, index){
        lightIntensity.setValue(item.lightIntensity)
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
