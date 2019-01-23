#include "viewmanager.h"

ViewManager::ViewManager(QObject *parent) : QObject(parent)
{

}

void ViewManager::passQMLFile(QString file){
    emit passedQMLFile(file);
}
