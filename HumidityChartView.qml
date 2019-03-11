import QtQuick 2.4

HumidityChartViewForm {
    Connections {
        target: controller
        onPassedDataToChartView: {
            console.log('ModuleId: '+moduleId + ' start: ' + startDate + ' endDate: ' + endDate)
            controlnetApi.getHumidityMeasurementsByModuleIdAndDate(moduleId, startDate, endDate)
        }
    }

    Connections {
        target: controlnetApi
        onHumidityMeasurementsReceived:{
            console.log("JSON: " + json)
            var humidityMeasurementsJSONObject = JSON.parse(json)
            var slotNames = humidityMeasurementsJSONObject.map(getSlotNames)
            var distinctSlotNames = slotNames.filter(distinct)
              .forEach(setSeries)
            chartView.axisX().max = (new Date(humidityMeasurementsJSONObject[humidityMeasurementsJSONObject.length - 1].date))
            chartView.axisX().min = (new Date(humidityMeasurementsJSONObject[0].date))
            var humidityMeasurements = humidityMeasurementsJSONObject.map(getHumidityMeasurements)
            chartView.axisY().max = humidityMeasurements.sort()[humidityMeasurements.length - 1]
            humidityMeasurementsJSONObject.forEach(setValues)
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
        chartView.series(item.slotName).append(toMsecsSinceEpoch(new Date(item.date)), item.humidity)
    }

    function getHumidityMeasurements(item){
        return item.humidity
    }

    function toMsecsSinceEpoch(date) {
        var msecs = date.getTime();
        return msecs;
    }
}
