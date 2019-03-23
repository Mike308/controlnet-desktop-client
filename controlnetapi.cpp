#include <QDebug>
#include "controlnetapi.h"

ControlnetApi::ControlnetApi(QObject *parent) : QObject(parent)
{
    restHandler = new RestHandler();
    timer = new QTimer();
    connect(restHandler, SIGNAL(receivedJson(QString,QString)), this, SLOT(onReceivedJSON(QString, QString)));
    connect(timer, SIGNAL(timeout()), this, SLOT(performHubRequest()));
}

void ControlnetApi::getSensorHubByModuleId(int moduleId){
    restHandler->getRequest(SRV_API + "/hub/module/" + QString::number(moduleId));
}

void ControlnetApi::getTemperaturesBySensorTypeAndDate(QString sensorType, QString startDate, QString endDate){
    restHandler->getRequest(SRV_API + "/temperatures/sensor-type/"+sensorType+"/start-date/"+QString(startDate)+"/end-date/"+QString(endDate));
}

void ControlnetApi::getTemperaturesByModuleIdAndDate(int moduleId, QString startDate, QString endDate){
    restHandler->getRequest(SRV_API + "/temperatures/module-id/"+QString::number(moduleId)+"/start-date/"+startDate+"/end-date/"+endDate);
}

void ControlnetApi::getHumidityMeasurementsByModuleIdAndDate(int moduleId, QString startDate, QString endDate){
    restHandler->getRequest(SRV_API + "/humidity/module-id/"+QString::number(moduleId)+"/start-date/"+startDate+"/end-date/"+endDate);
}

void ControlnetApi::getLightIntensityByModuleIdAndDate(int moduleId, QString startDate, QString endDate){
    restHandler->getRequest(SRV_API + "/light-intensity/module-id/" + QString::number(moduleId) + "/start-date/" + startDate + "/end-date/" + endDate);
}

void ControlnetApi::setSlotName(int sensorId, QString name){
    timer->stop();
    QJsonObject qJsonObject;
    qJsonObject.insert("sensorId",sensorId);
    qJsonObject.insert("newName", name);
    restHandler->postRequest("http://localhost:8080/sensor/set-slot-name", qJsonObject);
    timer->start(10000);
}

void ControlnetApi::getSensorsOfModule(int moduleId){
    restHandler->getRequest(SRV_API + "/sensor/module-id/"+QString(moduleId));
}

void ControlnetApi::stopRequesting(){
    timer->stop();
}

void ControlnetApi::clearAll(){
    qDebug () << "Deleting objects..";
    delete(timer);
    delete(restHandler);
}

void ControlnetApi::onReceivedJSON(QString json, QString path){
    QStringList items = path.split("/");
    if (items.length() > 1){
        if (!QString(items[1]).compare("hub")){
            emit hubReceived(json);
        }else if (!QString(items[1]).compare("module") || !QString(items[2]).compare("all")){
            emit modulesReceived(json);
        }else if (!QString(items[1]).compare("sensor") && !QString(items[2]).compare("module-id")){
            emit sensorsReceived(json);
        }else if (!QString(items[1]).compare("temperatures") && !QString(items[2]).compare("module-id")){
            emit temperaturesReceived(json);
        }else if (!QString(items[1]).compare("humidity") && !QString(items[2]).compare("module-id")){
            emit humidityMeasurementsReceived(json);
        }else if (!QString(items[1]).compare("light-intensity") && !QString(items[2]).compare("module-id")){
            emit lightIntensityReceived(json);
        }
    }
}

void ControlnetApi::startHubReqeusting(int moduleId){
    this->getSensorHubByModuleId(moduleId);
    this->moduleId = moduleId;
    timer->start(10000);
}

void ControlnetApi::getAllModules(){
    restHandler->getRequest(SRV_API + "/modules/all");
}

void ControlnetApi::performHubRequest(){
    this->getSensorHubByModuleId(moduleId);
    qDebug () << "Performed for module: " << moduleId;
}

