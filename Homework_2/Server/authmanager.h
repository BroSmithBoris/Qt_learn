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
    void registerRequestCompleted(QString);
    void authenticateRequestCompleted(QString, QString);
};

#endif // AUTHMANAGER_H
