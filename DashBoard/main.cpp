#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include"QQmlContext"
#include"DataSender/vehicledatasender.h"
#include"SqlDataBase/database.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    VehicleDataSender data;

    DataBase db("DataBase.db");
    if (db.isOpen())
       {
           db.createTable();
                db.getId();
    }

    QQmlApplicationEngine engine;
   engine.rootContext()->setContextProperty("testing",&data);
   engine.rootContext()->setContextProperty("database",&db);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
