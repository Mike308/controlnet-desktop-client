#include "controller.h"

Controller::Controller(QObject *parent) : QObject(parent)
{

}


void Controller::passQMLFile(QString fileName){
    emit passedQMLFileName(fileName);
}

void Controller::passDataToChartView(int moduleId, QString startDate, QString endDate, int measurementType){
    emit passedDataToChartView(moduleId, startDate, endDate, measurementType);
}

void Controller::passModuleId(int moduleId, QString moduleName){
    emit passedModuleId(moduleId, moduleName);
}
