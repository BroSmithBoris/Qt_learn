#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
public:
    explicit AuthManager(QObject *parent = nullptr);

    void authenticate(const QString &login,
                      const QString &password);
    void registering(const QString &login,
                     const QString &password);

private:
    QNetworkAccessManager _net;

signals:
    void registerRequestCompleted(QString error);
    void authenticateRequestCompleted(QString error, QString token);
};

#endif // AUTHMANAGER_H
