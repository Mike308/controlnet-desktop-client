import QtQuick 2.4

LxChartViewForm {
    zoomOut.onClicked: {
        chartView.zoomOut()
    }
    button.onClicked: {
        chartView.zoomReset()
    }
    zoomIn.onClicked: {
        chartView.zoomIn()
    }

    scrollLeft.onClicked: {
        chartView.scrollLeft(5)
    }
    scrollRight.onClicked: {
        chartView.scrollRight(5)
    }



    Connections {
        target: controller
        onPassedDataToChartView: {
            console.log('ModuleId: '+moduleId + ' start: ' + startDate + ' endDate: ' + endDate)
            controlnetApi.getLightIntensityByModuleIdAndDate(moduleId, startDate, endDate)
        }
    }

    Connections {
        target: controlnetApi
        onLightIntensityReceived:{
            console.log("JSON: " + json)
            var lightIntensityJSONObject = JSON.parse(json)
            var slotNames = lightIntensityJSONObject.map(getSlotNames)
            var distinctSlotNames = slotNames.filter(distinct)
                                             .forEach(setSeries)
            chartView.axisX().max = (new Date(lightIntensityJSONObject[lightIntensityJSONObject.length - 1].date))
            chartView.axisX().min = (new Date(lightIntensityJSONObject[0].date))
            var lightIntensity = lightIntensityJSONObject.map(getLightIntensity)
            chartView.axisY().max = lightIntensity.sort()[lightIntensity.length - 1]
            lightIntensityJSONObject.forEach(setValues)

        }
    }

    function parseTest(item, index){
        var slotNames = []
        slotNames.push(item.slotName);
    }

    function getSlotNames(item){
        return item.slotName
    }

    function distinct(value, index, self){
        return self.indexOf(value) === index
    }

    function setSeries(item, index){
        chartView.createSeries(ChartView.SeriesTypeSpline, item, xDateAxis)
    }

    function setValues(item, index){
        var series = chartView.series(item.slotName)
        chartView.series(item.slotName).append(toMsecsSinceEpoch(new Date(item.date)), item.lightIntensity)
    }

    function getLightIntensity(item){
        return item.lightIntensity
    }

    function toMsecsSinceEpoch(date) {
        var msecs = date.getTime();
        return msecs;
    }

}
