#ifndef VIEWMANAGER_H
#define VIEWMANAGER_H

#include <QObject>

class ViewManager : public QObject
{
    Q_OBJECT
public:
    explicit ViewManager(QObject *parent = nullptr);


signals:
    void passedQMLFile(QString file);
public slots:
    void passQMLFile(QString file);
};

#endif // VIEWMANAGER_H
