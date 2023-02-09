#include "vehicledatasender.h"
#include"database.h"
#include<QDateTime>
DataBase obj;
int VehicleDataSender::speed=0;
int VehicleDataSender::rpm=0;
int VehicleDataSender::fuel=50;
int VehicleDataSender::temp=10;
QString steerData;
VehicleDataSender::VehicleDataSender(QObject *parent)
    : QObject{parent}
{

Speedtimer->setInterval(500);
Rpmtimer->setInterval(500);
Temptimer->setInterval(2000);
Fueltimer->setInterval(10000);
Enginetimer->setInterval(500);


connect(Start,SIGNAL(timeout()),this,SLOT(OpenWindow()));

connect(Speedtimer,SIGNAL(timeout()),this,SLOT(CurrentTime()));
             connect(Speedtimer,SIGNAL(timeout()),this,SLOT(NotifyVehicleSpeed()));
  connect(Rpmtimer,SIGNAL(timeout()),this,SLOT(NotifyEngineRPM()));
    connect(Temptimer,SIGNAL(timeout()),this,SLOT(NotifyOutsideTemp()));
    connect(Fueltimer,SIGNAL(timeout()),this,SLOT(NotifyFuelLevel()));
    connect(Enginetimer,SIGNAL(timeout()),this,SLOT(engineTIme()));
    connect(blinkTimer,SIGNAL(timeout()),this,SLOT(blinker()));
}

QString VehicleDataSender::userDefault()
{
       QString user=obj.accessSelectedperson();
       qDebug()<<user;
       return user;
}





void VehicleDataSender::NotifyVehicleSpeed()
{
           speed=speed+1;
           if(speed>260)
           {
               Speedtimer->stop();
           }
           QString sp=QString::number(speed);
       emit notice(QVariant(sp));

}

void VehicleDataSender::NotifyEngineRPM()
{
            rpm=(rpm+1);


            if(rpm>245)
            {
                Rpmtimer->stop();
            }
   emit notice2(rpm);

}

void VehicleDataSender::NotifyOutsideTemp()
{

        temp=temp+1;
        if(temp==35)
        {
           Temptimer->stop();
        }
         QString Te=QString::number(temp);

    emit temperature(QVariant(Te));

}

void VehicleDataSender::NotifyFuelLevel()
{
   fuel= fuel-1;
   QString l="Low";
    QString fu=QString::number(fuel);

    if(fuel<=10)
    {

            emit level(QVariant(l));

    }
    if(fuel==0)
    {
         Fueltimer->stop();
    }




  emit level(QVariant(fu));


}

void VehicleDataSender::CurrentTime()
{
    int cnt=0;
    cnt++;
    QDateTime date = QDateTime::currentDateTime();


          QString Time = date.toString("hh:mm");

          emit time(QVariant(Time));


}
void VehicleDataSender::engineTIme()
{
    QString m="Min";
    QString h="Hour";
 cnt++;
 if(cnt%60==0)
 {
           emit engine(QVariant(m));
  }
 if((cnt%3600)==0)
 {
            emit engine(QVariant(h));
  }
 if(cnt==60)
 {
     cnt=0;
 }


     emit engine(cnt);



}

void VehicleDataSender::blinker()
{
   blinkcnt++;
   Recnt++;
   if(Recnt==1)
   {
    Recnt2++;
   }

   if((blinkcnt)%2==0)
   {
    emit blinkernotice("Blink1");
    }
       if((blinkcnt)%2==1)
     {
           emit blinkernotice("Blink2");
       }

     if(fromQml=="1")
     {
            Recnt=0;
         if(Recnt2==200)
         {
             emit blinkernotice("ReStart");
         }
     }
     if(Recnt2>=200)
     {
         blinkTimer->stop();
     }
}

Q_INVOKABLE void VehicleDataSender::stopTimer(QString value)
{
    fromQml=value;
    Speedtimer->stop();
    Rpmtimer->stop();
    Temptimer->stop();
    Fueltimer->stop();
    Enginetimer->stop();


}

void VehicleDataSender::startTimer()
{
    qDebug()<<"started";
    Speedtimer->start();
    Rpmtimer->start();
    Temptimer->start();
    Fueltimer->start();
    Enginetimer->start();

      blinkTimer->start(200);

}


QString VehicleDataSender::startButton()
{


    Start->setInterval(5000);
    Start->start();



          QString Time ="ok";
          return Time;


}

void VehicleDataSender::OpenWindow()
{
    emit startnotice("start");
    emit startnotice(m);
    emit hour(h);


    Start->stop();
}

Q_INVOKABLE void VehicleDataSender::fromSteering(QString data)
{
    qDebug()<<"c++"<<data;

     steerData=data;
     emit steernotice(QVariant(steerData));


}

void VehicleDataSender::dBData()
{
    EngineTime=obj.accessData();
    QString Hour=EngineTime;
    QString Minute=EngineTime;
    QString Second=EngineTime;
  Hour.erase(Hour.begin()+1,Hour.end());
   qDebug()<<"DBDATA"<<Hour;


   h=Hour.toInt();
   Minute.erase(Minute.begin()+0,Minute.begin()+3);
   Minute.erase(Minute.begin()+1,Minute.end());

   m=Minute.toInt();
  Second.erase(Second.begin()+0,Second.end()-3);
  Second.replace(QString("S"),QString(""));

  s=Second.toInt();
  cnt=s;

  QString Distance=obj.accessDistance();
  TotalDist=Distance;
  qDebug()<<Distance;
  Distance.erase(Distance.begin()+3,Distance.end());
  qDebug()<<Distance;
           d=Distance.toFloat();
           qDebug()<<"distance"<<d;
          // speed=d;

}

void VehicleDataSender::toDisplay(QString signal)
{
 if(signal=="sent")
     emit startnotice("sent");
}

QString VehicleDataSender::totalDistance()
{
    return TotalDist;
}

QString VehicleDataSender::totalMIn()
{
    QString min=QString::number(m);
    return min;
}

void VehicleDataSender::fromCarSettings(QString pe, QString sm, QString bg, QString fo)
{
    Person=pe;
    SMcolor=sm;
    BgColor=bg;
    FontColor=fo;
    needlecolor(sm);
    fontcolor(fo);
    backcolor(bg);
obj.selectedUser(pe,sm,bg,fo);

    qDebug()<<"fromsetting"<<Person<<" "<<SMcolor<<" "<<BgColor<<" "<<FontColor;

}


