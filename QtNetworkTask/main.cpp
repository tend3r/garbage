#include <QCoreApplication>

#include "authmanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    AuthManager auth;
    auth.registration("my_login",
                     "my_password");
    auth.authentication("my_login",
                        "my_password");


    return a.exec();
}
