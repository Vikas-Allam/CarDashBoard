#include "database.h"
#include<QDebug>
#include<QSqlQuery>
#include<QSqlRecord>
#include<QSqlError>
#include<QSqlField>
DataBase::DataBase()
{

}

DataBase::DataBase(const QString &path)

{
    db=QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(path);

    if(!db.open())
    {
        qDebug()<<"error"<<"\n";


    }
    else
    {

        qDebug()<<"ok"<<"\n";
    }
}

bool DataBase::isOpen() const
{
    return db.isOpen();

}

bool DataBase::createTable()
{


 bool success = true;

        QSqlQuery query;
  query.prepare("CREATE TABLE DashBoard(id INTEGER PRIMARY KEY,EngineTime TEXT,Speed TEXT);");
  query.prepare("CREATE TABLE UserSettings(id INTEGER PRIMARY KEY,Person TEXT,NeedleColor TEXT,BGColor TEXT,FontColor TEXT);");
  query.prepare("CREATE TABLE SelectedUser(id INTEGER PRIMARY KEY,Person TEXT,NeedleColor TEXT,BGColor TEXT,FontColor TEXT);");


        if (!query.exec())
        {
            qDebug() << "Couldn't create the table 'DashBoard': one might already exist.";
            success = false;
                return success;
        }
        return success;


}

 QVector<QString> DataBase::getPerson()
{

QVector<QString>vec;
     QSqlQuery query("SELECT * FROM UserSettings");

     int idName = query.record().indexOf("Person");
     QString name;

     while (query.next())
     {
        name= query.value(idName).toString();
        vec.push_back(name);
     }
  return vec;

}
 QVariant DataBase::getId()
 {
     QSqlQuery query("SELECT * FROM UserSettings");

     int idName = query.record().indexOf("id");
     QString name;

     while (query.next())
     {
        name= query.value(idName).toString();

     }

  qDebug()<<"getid"<< name;
  int n=name.toInt();
  return n;

 }

void DataBase::getdata(QString hour,QString min,QString sec,QString speed)
{

    QString TD=accessDistance();
       float Distance=TD.toFloat();
       qDebug()<<"database"<<Distance;
       QString colon=":";

       float n=speed.toFloat();
       n=n/1000;
       n=n+Distance;
       speed=QString::number(n);
       speed.erase(speed.begin()+3,speed.end());


       Speed=speed+"KM";

       EngineTime=hour+"H"+colon+min+"M"+colon+sec+"S";
        bool d=addData();
        if(d==true)
        {
            qDebug()<<"data Added Successfully";
        }

        qDebug()<<"speed"<<Speed;
}

DataBase::~DataBase()
{
    if (db.isOpen())
    {
        db.close();
    }
}
bool DataBase::addData()
{
    bool success = false;

        QSqlQuery queryAdd;

        queryAdd.prepare("INSERT INTO DashBoard (EngineTime,Speed) VALUES (:EngineTime,:Speed)");
        queryAdd.bindValue(":EngineTime", EngineTime);
        queryAdd.bindValue(":Speed", Speed);


        if(queryAdd.exec())
        {
            success = true;
        }
        else
        {
            qDebug() << "add Data failed: " << queryAdd.lastError();
        }


        return success;
}

QString DataBase::accessDistance()
{
    QSqlQuery qry;
QString speed;
        qry.exec("select * from DashBoard");

        while (qry.next()) {

             speed =qry.value("Speed").toString();

        }

        return speed;
}
QString DataBase::accessData()
{

             QSqlQuery qry;
QString enginetime;
                 qry.exec("select * from DashBoard");

                 while (qry.next()) {

                      enginetime =qry.value("EngineTime").toString();

                 }

                 return enginetime;




}

void DataBase::getSettings(QString Person, QString NeedleColor, QString BGColor, QString FontColor)
{
    bool success = false;
        // removeData(Person);
        QSqlQuery queryAdd;


        if (dataExists(Person))
        {
            qDebug()<<"update";
               updateData(Person,NeedleColor,BGColor,FontColor);
        }
        else
{

        queryAdd.prepare("INSERT INTO UserSettings (Person,NeedleColor,BGColor,FontColor) VALUES (:Person,:NeedleColor,:BGColor,:FontColor)");
        queryAdd.bindValue(":Person", Person);
        queryAdd.bindValue(":NeedleColor", NeedleColor);
        queryAdd.bindValue(":BGColor", BGColor);
        queryAdd.bindValue(":FontColor", FontColor);



        if(queryAdd.exec())
        {
            success = true;
        }
        else
        {
            qDebug() << "add Data failed: " << queryAdd.lastError();
        }

}
}

bool DataBase::removeAlldata()
{
    bool success = false;

    QSqlQuery removeQuery;
    removeQuery.prepare("DELETE FROM DashBoard");

    removeQuery.prepare("DELETE FROM UserSettings");
   // removeQuery.prepare("DELETE FROM SelectedUser");
    if (removeQuery.exec())
    {
        success = true;
    }
    else
    {
        qDebug() << "remove all DashBoard failed: " << removeQuery.lastError();
    }

    return success;
}

 QList<QVariant>  DataBase::accessRow(QString usrNam)
{

     qDebug()<<"accessrow"<<usrNam;

        QSqlQuery query;
        query.prepare("SELECT Person, NeedleColor, BGColor, FontColor"
                      " FROM UserSettings WHERE Person = :usrNam");
        query.bindValue(":usrNam", usrNam);

        QList<QVariant> list;

        if (!query.exec())
        {
            qDebug() << "Query failed!";
        }
        else
        {
            if (query.first())
            {
                list.append(query.value("Person"));
                list.append(query.value("NeedleColor"));
                list.append(query.value("BGColor"));
                list.append(query.value("FontColor"));
            }
            else
            {
                qDebug () << "Data not found";
            }
        }
        for(auto i:list)
            qDebug()<<i;


        return list;



    }
 bool DataBase::removeData(const QString &data)
 {
     bool success = false;

     if (dataExists(data))
     {
         QSqlQuery queryDelete;
         queryDelete.prepare("DELETE FROM SelectedUser WHERE Person = (:Person)");

         queryDelete.bindValue(":Person",data);

         success = queryDelete.exec();


         if(!success)
         {
             qDebug() << "remove Data failed: " << queryDelete.lastError();
         }
     }
     else
     {
         qDebug() << "remove Data failed: person doesnt exist";
     }

     return success;
 }
 bool DataBase::dataExists(const QString &Person) const
 {
     bool exists = false;

     QSqlQuery checkQuery;
        checkQuery.prepare("SELECT Person FROM SelectedUser WHERE Person = (:Person)");

     checkQuery.bindValue(":Person",Person);


     if (checkQuery.exec())
     {
         if (checkQuery.next())
         {
             exists = true;
            }
     }
     else
     {
         qDebug() << "DATA exists failed: " << checkQuery.lastError();

     }
  qDebug()<<"dataesist"<<exists;
  return exists;
 }

 void DataBase::updateData(QString Person, QString NeedleColor, QString BGColor, QString FontColor)
 {
     QSqlQuery qry;
     qry.prepare( "UPDATE UserSettings SET  Person= :Person, NeedleColor = :NeedleColor, BGColor = :BGColor, FontColor = :FontColor  WHERE Person = :Person" );
      qry.bindValue(":Person", Person);


      qry.bindValue(":NeedleColor", NeedleColor);

      qry.bindValue(":BGColor", BGColor);
      qry.bindValue(":FontColor", FontColor);

      if( !qry.exec() )
         qDebug() << qry.lastError();
       else
          qDebug( "Updated!" );
 }

 void DataBase::selectedUser(QString Person, QString NeedleColor, QString BGColor, QString FontColor)
 {
     bool success = false;
         removeData(Person);
         QSqlQuery queryAdd;



 {

         queryAdd.prepare("INSERT INTO SelectedUser (Person,NeedleColor,BGColor,FontColor) VALUES (:Person,:NeedleColor,:BGColor,:FontColor)");
         queryAdd.bindValue(":Person", Person);
         queryAdd.bindValue(":NeedleColor", NeedleColor);
         queryAdd.bindValue(":BGColor", BGColor);
         queryAdd.bindValue(":FontColor", FontColor);



         if(queryAdd.exec())
         {
             success = true;
         }
         else
         {
             qDebug() << "add Data failed: " << queryAdd.lastError();
         }

         }
 }

 QString DataBase::accessSelectedperson()
 {

          QSqlQuery query("SELECT * FROM SelectedUser");

          int idName = query.record().indexOf("Person");
          QString name;

          while (query.next())
          {
             name= query.value(idName).toString();

          }
     return name;
 }

 QList<QVariant> DataBase::accessSelectedUser(QString Person)
 {
        QSqlQuery query;
        query.prepare("SELECT Person, NeedleColor, BGColor, FontColor"
                      " FROM SelectedUser WHERE Person = :Person");
        query.bindValue(":Person", Person);

        QList<QVariant> list;

        if (!query.exec())
        {
            qDebug() << "Query failed!";
        }
        else
        {
            if (query.first())
            {
                list.append(query.value("Person"));
                list.append(query.value("NeedleColor"));
                list.append(query.value("BGColor"));
                list.append(query.value("FontColor"));
            }
            else
            {
                qDebug () << "Data not found";
            }
        }



        return list;

 }

