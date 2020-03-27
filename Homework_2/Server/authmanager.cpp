#include "authmanager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

AuthManager::AuthManager(QObject *parent) : QObject(parent)
{

}

void AuthManager::registering(const QString &login,
                              const QString &password)
{
    QUrl url("http://127.0.0.1:59325/register");

    QNetworkRequest requst(url);
    requst.setHeader(QNetworkRequest::ContentTypeHeader,
                     "application/json");

    QJsonObject body;
    body["login"] = login;
    body["password"] = password;
    QByteArray bodyData = QJsonDocument(body).toJson();

    QNetworkReply *reply = _net.post(requst, bodyData);

    connect(reply, &QNetworkReply::finished,
            [this, reply](){
        if (reply->error() != QNetworkReply::NoError) {
            qDebug() << "Error: " << reply -> errorString();
        }
        else {
            qDebug() << "Ok";
        }
        this->onAuthenticateFinished();
    });
}

void AuthManager::authenticate(const QString &login,
                               const QString &password)
{
    QUrl url ("http://127.0.0.1:59325/auth");

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,
                     "application/json");
    QJsonObject body;
    body ["login"] = login;
    body ["password"] = password;
    QByteArray bodyData = QJsonDocument(body).toJson();

    QNetworkReply *reply= _net.post(request, bodyData);

    connect(reply, &QNetworkReply::finished,
            [this, reply](){
        if (reply -> error() != QNetworkReply::NoError) {
            qDebug() << "Error: " << reply -> errorString();
        }
        else {
            QJsonObject obj = QJsonDocument::fromJson(reply -> readAll()).object();
            QString token = obj.value("token").toString();
            this->token = token;
        }
        this -> onRegisterFinished();
        reply -> deleteLater();
    });
}

QString AuthManager::getToken()
{
    return this->token;
}

void AuthManager::onAuthenticateFinished()
{
    qDebug() << "Auth error: " << this -> authenticateError;
    qDebug() << "Token: " << this -> getToken();
    emit registerRequestCompleted(this -> authenticateError);
}

void AuthManager::onRegisterFinished()
{
    qDebug() << "Register error: " << this -> registerError;
    emit registerRequestCompleted(this -> registerError);
}
