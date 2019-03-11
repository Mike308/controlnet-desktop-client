#ifndef CONTROLNETAPI_H
#define CONTROLNETAPI_H

#include <QObject>
#include <QTimer>
#include "resthandler.h"

class ControlnetApi : public QObject
{
    Q_OBJECT
public:
    explicit ControlnetApi(QObject *parent = nullptr);


private:
    RestHandler *restHandler;
    QString SRV_API = "http://localhost:8080";
    QTimer *timer;
    int moduleId;
    void getSensorHubByModuleId(int moduleId);
signals:
    void hubReceived(QString json);
    void temperaturesReceived(QString json);
    void humidityMeasurementsReceived(QString json);
    void modulesReceived(QString json);
    void sensorsReceived(QString json);
    void lightIntensityReceived(QString json);
public slots:
    void getTemperaturesBySensorTypeAndDate(QString sensorType, QString startDate,  QString endDate);
    void getTemperaturesByModuleIdAndDate(int moduleId, QString startDate, QString endDate);
    void getHumidityMeasurementsByModuleIdAndDate(int moduleId, QString startDate, QString endDate);
    void getLightIntensityByModuleIdAndDate(int moduleId, QString startDate, QString endDate);
    void startHubReqeusting(int moduleId);
    void getAllModules();
    void getSensorsOfModule(int moduleId);
    void stopRequesting();
    void clearAll();
private slots:
    void onReceivedJSON(QString json, QString path);
    void performHubRequest();

};

#endif // CONTROLNETAPI_H
