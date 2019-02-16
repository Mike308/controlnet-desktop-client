#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include "controlnetapi.h"

class Controller : public QObject
{
    Q_OBJECT
public:
    explicit Controller(QObject *parent = nullptr);


signals:
    void passedQMLFileName(QString fileName);
    void passedDataToChartView(int moduleId, QString startDate, QString endDate, int measurementType);
    void passedModuleId(int moduleId, QString moduleName);

public slots:
    void passQMLFile(QString fileName);
    void passDataToChartView(int moduleId, QString startDate, QString endDate,  int measurementType);
    void passModuleId(int moduleId, QString moduleName);

};

#endif // CONTROLLER_H
