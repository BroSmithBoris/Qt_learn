#include "authmanager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

AuthManager::AuthManager(QObject *parent) : QObject(parent)
{
    m_isAuthenticateProcessing = false;
    m_isRegisterProcessing = false;
}

bool AuthManager::isAuthenticateProcessing()
{
    return m_isAuthenticateProcessing;
}

void AuthManager::setAuthenticateProcessing(bool value)
{
    if(m_isAuthenticateProcessing==value)
        return;
    m_isAuthenticateProcessing=value;
    emit authenticateProcessingChanged(value);
}

bool AuthManager::isRegisterProcessing()
{
    return m_isRegisterProcessing;
}

void AuthManager::setRegisterProcessing(bool value)
{
    if(m_isRegisterProcessing==value)
        return;
    m_isRegisterProcessing=value;
    emit registerProcessingChanged(value);
}

void AuthManager::registering(const QString &login,
                              const QString &password)
{
    setRegisterProcessing(true);
    QUrl url("http://127.0.0.1:58589/register");

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
        if(reply->error()!=QNetworkReply::NoError)
            emit registerRequestError(reply -> errorString());
        else
            emit registerRequestCompleted();
        reply -> deleteLater();
        setRegisterProcessing(false);
    });
}

void AuthManager::authenticate(const QString &login,
                               const QString &password)
{
    setAuthenticateProcessing(true);
    QUrl url ("http://127.0.0.1:58589/auth");

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
        if(reply->error()!=QNetworkReply::NoError)
            emit authenticateRequestError(reply -> errorString());
        else {
            QJsonObject obj = QJsonDocument::fromJson(reply -> readAll()).object();
            QString token = obj.value("token").toString();
            emit authenticateRequestCompleted(reply -> errorString(), token);
        }
        reply -> deleteLater();
        setAuthenticateProcessing(false);
    });
}
