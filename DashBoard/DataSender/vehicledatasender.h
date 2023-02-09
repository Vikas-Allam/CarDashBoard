#pragma once

#include <QObject>
#include<QTimer>
#include<QVariant>
#include<QThread>
#include<cstring>

class VehicleDataSender : public QObject
{
    Q_OBJECT
public:
    explicit VehicleDataSender(QObject *parent = nullptr);

signals:
    void notice(QVariant data);
    void notice2(QVariant data2);
    void level(QVariant data3);
    void temperature(QVariant data4);
    void time(QVariant data5);
    void engine(QVariant data6);
    void blinkernotice(QVariant data7);
    void startnotice(QVariant data8);
    void steernotice(QVariant data9);
    void hour(QVariant data10);
    void needlecolor(QVariant color1);
    void fontcolor(QVariant color2);
    void backcolor(QVariant color3);

public slots:
  void NotifyVehicleSpeed();
  void NotifyEngineRPM();
  void NotifyOutsideTemp();
  void NotifyFuelLevel();
  void CurrentTime();
  void engineTIme();
  void blinker();
  void stopTimer(QString);
  void startTimer();
  QString startButton();
  void OpenWindow();
  void fromSteering(QString);
  void dBData();
void toDisplay(QString);
QString totalDistance();
QString totalMIn();
void fromCarSettings(QString,QString,QString,QString);
QString userDefault();
private:
  QTimer *Speedtimer=new QTimer();
  QTimer *Rpmtimer=new QTimer();
   QTimer *Temptimer=new QTimer();
    QTimer *Fueltimer=new QTimer();
    QTimer *Enginetimer=new QTimer();
QTimer *blinkTimer=new QTimer();
QTimer *Start=new QTimer();
QTimer t;
     QString FuelLevel,fromQml;
       int cnt;
       int Recnt,Recnt2=0;
       int h,m,s,d;
int blinkcnt=0,fuelcnt=0;

QString  EngineTime,TotalDist;
     static int rpm,temp,fuel,speed;
QString Person,SMcolor,BgColor,FontColor;
};

//#endif // VEHICLEDATASENDER_H
