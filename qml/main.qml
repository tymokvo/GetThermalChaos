import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    visible: true
    width: 960
    height: 540
    title: qsTr("GetThermalChaos")

    Viewer {
        anchors.fill: parent
    }
}
