#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isAuthenticateProcessing READ isAuthenticateProcessing WRITE setAuthenticateProcessing NOTIFY authenticateProcessingChanged)
    Q_PROPERTY(bool isRegisterProcessing READ isRegisterProcessing WRITE setRegisterProcessing NOTIFY registerProcessingChanged)
public:
    explicit AuthManager(QObject *parent = nullptr);

    Q_INVOKABLE void authenticate(const QString &login,
                      const QString &password);
    Q_INVOKABLE void registering(const QString &login,
                     const QString &password);
    bool isAuthenticateProcessing();
    void setAuthenticateProcessing(bool value);
    bool isRegisterProcessing();
    void setRegisterProcessing(bool value);

private:
    QNetworkAccessManager _net;
    bool m_isAuthenticateProcessing;
    bool m_isRegisterProcessing;

signals:
    void registerRequestCompleted();
    void authenticateRequestCompleted(QString error, QString token);

    void registerRequestError(QString error);
    void authenticateRequestError(QString error);

    void authenticateProcessingChanged(bool value);
    void registerProcessingChanged(bool value);
};

#endif // AUTHMANAGER_H
