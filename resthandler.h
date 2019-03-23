#ifndef RESTHANDLER_H
#define RESTHANDLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QUrl>

class RestHandler : public QObject
{
    Q_OBJECT
public:
    explicit RestHandler(QObject *parent = nullptr);
    void getRequest(QString urlStr);
    void postRequest(QString urlStr, QJsonObject json);
    void clearAll();


private:
     QNetworkAccessManager *restClient;
     QNetworkReply *reply;



signals:
     void receivedJson(QString json, QString path);

public slots:
     void onFinished(QNetworkReply* reply);
     void performGetRequest(QString url);
};

#endif // RESTHANDLER_H
