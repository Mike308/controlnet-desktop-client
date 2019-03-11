import QtQuick 2.4

TemperaturesForm {
    listView.onXChanged: console.log("Item Index: "+listView.currentIndex + " Pixel: ")
}
