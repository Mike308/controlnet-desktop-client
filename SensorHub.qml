import QtQuick 2.4

SensorHubForm {

    Connections {
        target: controller
        onPassedModuleId: {
            moduleNameLabel.text = moduleName
            controlnetApi.startHubReqeusting(moduleId)
        }
    }

    Connections {
        target: controlnetApi
        onHubReceived: {
            var jsonObject = JSON.parse(json)
            jsonObject.temperatures.forEach(parseTemperature)
        }
    }

    function parseTemperature(item, index){
       temperatures.temperatures.set(index, item)
    }


}
