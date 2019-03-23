#include "resthandler.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>

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

void RestHandler::postRequest(QString urlStr, QJsonObject json){
    QUrl url(urlStr);
    QNetworkRequest request;
    QJsonDocument qJsonDoc(json);
    QByteArray jsonData = qJsonDoc.toJson();
    qDebug () << "Array: " << jsonData;
    request.setUrl(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,"application/json");
    request.setHeader(QNetworkRequest::ContentLengthHeader, QByteArray::number(jsonData.size()));
    restClient->post(request, jsonData);
}

void RestHandler::clearAll(){
    delete(restClient);
}

void RestHandler::onFinished(QNetworkReply *reply){
    QJsonDocument jsonDocument;
    jsonDocument = QJsonDocument::fromJson(reply->readAll());
    emit receivedJson(QString(jsonDocument.toJson(QJsonDocument::Compact)), reply->request().url().path());
}

void RestHandler::performGetRequest(QString url){
    this->getRequest(url);
}







