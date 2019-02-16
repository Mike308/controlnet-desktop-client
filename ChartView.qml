import QtQuick 2.4
import QtQuick.Controls 2.5
import QtCharts 2.3

ChartViewForm {
    button.onClicked: {

    }

    Connections {
        target: controller
        onPassedDataToChartView: {
            console.log('ModuleId: '+moduleId + ' start: ' + startDate + ' endDate: ' + endDate)
            controlnetApi.getTemperaturesByModuleIdAndDate(moduleId, startDate, endDate)
        }
    }

    Connections {
        target: controlnetApi
        onTemperaturesReceived:{
            console.log("JSON: " + json)
            var temperaturesJSONObject = JSON.parse(json)
            var slotNames = temperaturesJSONObject.map(getSlotNames)
            var distinctSlotNames = slotNames.filter(distinct)
              .forEach(setSeries)
            chartView.axisX().max = (new Date(temperaturesJSONObject[temperaturesJSONObject.length - 1].date))
            chartView.axisX().min = (new Date(temperaturesJSONObject[0].date))
            var temperatures = temperaturesJSONObject.map(getTemperatures)
            chartView.axisY().max = temperatures.sort()[temperatures.length - 1]
            temperaturesJSONObject.forEach(setValues)


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
        chartView.series(item.slotName).append(toMsecsSinceEpoch(new Date(item.date)), item.temperature)
    }

    function getTemperatures(item){
        return item.temperature
    }

    function toMsecsSinceEpoch(date) {
        var msecs = date.getTime();
        return msecs;
    }

}
