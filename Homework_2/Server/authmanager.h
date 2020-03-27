#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
public:
    QString authenticateError;
    QString registerError;
    QString getToken();

    explicit AuthManager(QObject *parent = nullptr);

    void authenticate(const QString &login,
                      const QString &password);

    void registering(const QString &login,
                     const QString &password);


private slots:
    void onRegisterFinished();
    void onAuthenticateFinished();

private:
    QNetworkAccessManager _net;
    QString token;

signals:
    void registerRequestCompleted(QString);
    void authenticateRequestCompleted(QString);

};

#endif // AUTHMANAGER_H
