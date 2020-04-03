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

    void authentication(const QString &login,
                        const QString &password);

    void registration(const QString &login,
                   const QString &password);

signals:
    void regReqComplete(QString);
    void authReqComplete(QString, QString);

private:
    QNetworkAccessManager _net;

};

#endif // AUTHMANAGER_H
