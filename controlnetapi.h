#ifndef CONTROLNETAPI_H
#define CONTROLNETAPI_H

#include <QObject>

class ControlnetApi : public QObject
{
    Q_OBJECT
public:
    explicit ControlnetApi(QObject *parent = nullptr);

signals:

public slots:
};

#endif // CONTROLNETAPI_H