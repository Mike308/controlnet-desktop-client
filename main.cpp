#include <QtWidgets/QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "resthandler.h"
#include "controlnetapi.h"
#include "controller.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQmlApplicationEngine engine;
    RestHandler resthandler;
    ControlnetApi controlnetApi;
    Controller controller;
    QQmlContext *context = engine.rootContext();

    context->setContextProperty("restHandler", &resthandler);
    context->setContextProperty("controlnetApi", &controlnetApi);
    context->setContextProperty("controller", &controller);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
