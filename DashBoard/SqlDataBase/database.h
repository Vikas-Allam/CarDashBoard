#pragma once

#include <QObject>
#include<QSqlDatabase>
#include<QVariant>
#include<cstring>
using namespace std;
class DataBase:public QObject
{
    Q_OBJECT
public:
    DataBase();
    explicit DataBase(const QString &path);
    ~DataBase();
    bool  isOpen() const;
       bool createTable();
       bool addData();
       QString accessDistance();
      bool removeAlldata();
    bool  removeData(const QString &);
    bool dataExists(const QString &)const;
    void updateData(QString,QString,QString,QString);
    void selectedUser(QString,QString,QString,QString);

public slots:
       void getdata(QString,QString,QString,QString);
       QString accessData();
        QVector<QString> getPerson();
    QVariant getId();
       void getSettings(QString,QString,QString,QString);
       QList<QVariant> accessRow(QString);
       QList<QVariant>  accessSelectedUser(QString);
       QString accessSelectedperson();

private:
       QSqlDatabase db;
       QString Minute,Hour,Second;
        QString EngineTime,Speed;
};

