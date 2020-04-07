#include <QCoreApplication>
#include "authmanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    AuthManager auth;
    auth.registering("login",
                     "my_password");
    auth.authenticate("login",
                      "my_password");
    return a.exec();
}
