#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "resthandler.h"
#include "controlnetapi.h"
#include "viewmanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    RestHandler resthandler;
    ControlnetApi controlnetApi;
    ViewManager viewManager;
    controlnetApi.getSensorHubByModuleId(1);
    QQmlContext *context = engine.rootContext();

    context->setContextProperty("restHandler", &resthandler);
    context->setContextProperty("controlnetApi", &controlnetApi);
    context->setContextProperty("viewManager", &viewManager);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
