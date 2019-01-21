#include "resthandler.h"
#include <QJsonDocument>
#include <QJsonObject>

RestHandler::RestHandler(QObject *parent) : QObject(parent)
{
    restClient = new QNetworkAccessManager(this);
    connect(restClient, SIGNAL(finished(QNetworkReply*)), this, SLOT(onFinished(QNetworkReply*)));
}

void RestHandler::getRequest(QString urlStr){
    QUrl url(urlStr);
    QNetworkRequest request;
    request.setUrl(url);
    reply = restClient->get(request);
}

void RestHandler::onFinished(QNetworkReply *reply){
    QJsonDocument jsonDocument;
    jsonDocument = QJsonDocument::fromJson(reply->readAll());
    emit receivedJson(QString(jsonDocument.toJson(QJsonDocument::Compact)), reply->request().url().path());

}

void RestHandler::performGetRequest(QString url){
    this->getRequest(url);
}





