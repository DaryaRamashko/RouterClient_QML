#ifndef SOCKETCONTROLLER_H
#define SOCKETCONTROLLER_H

#include <QObject>
#include <QQmlApplicationEngine>
#include "mytcpsocket.h"

class SocketController : public QObject
{
    Q_OBJECT

private:
    QObject *rootObject;
    QObject *loginTextInput;
    QObject *passwordTextInput;
    QObject *hostAddressTextInput;
    QObject *configHostAddressTextInput;
    QObject *networkMaskTextInput;
    QObject *macAddressTextInput;
    QObject *ssidTextInput;
    QObject *modelTextInput;
    QObject *hostNameTextInput;
    QObject *serviceCodeTextInput;
    QObject *workGroupTextInput;
    MyTcpSocket socket;
    void init();

public:
    explicit SocketController(QObject *parent = 0);
    QQmlApplicationEngine engine;

signals:
    void sendErrorMessage(QString message);

public slots:
    void recieveLoginClick();
    QString getInfo(QString message);
    QString getParamInfo(QString paramName);
    int permitSetInfo(QString message); // 1 - permitted, 0 - not permitted
    int confirmLoginAndPassword(QString login, QString password); // 1 - ok, 0 - not ok
    void close();
};

#endif // SOCKETCONTROLLER_H
