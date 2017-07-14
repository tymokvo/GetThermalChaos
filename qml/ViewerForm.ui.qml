import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtMultimedia 5.5
import GetThermal 1.0
import "qrc:/controls"
import "qrc:/images"

Item {
    id: item1
    anchors.fill: parent

    property alias acq: acq
    property alias player: player
    property alias videoOutput: videoOutput
    width: 640


    RowLayout {
        opacity: 1
        spacing: 0
        anchors.fill: parent

        Pane {
            x: 0
            width: 510
            opacity: 1
            bottomPadding: 5
            rightPadding: 5
            leftPadding: 5
            topPadding: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            background: Rectangle {
                anchors.fill: parent
                color: "#000000"
            }

            VideoOutput {
                id: videoOutput
                x: 0
                y: 0
                antialiasing: true
                anchors.fill: parent
                fillMode: VideoOutput.PreserveAspectFit
                source: player
            }
        }

        Pane {
            width: 130
            Layout.minimumWidth: 130
            Layout.fillHeight: true
            visible: acq.cci.supportsRadiometry
            background: Rectangle {
                anchors.fill: parent
                color: "#000000"
            }

            RangeDisplay {
                anchors.rightMargin: 12
                anchors.bottomMargin: 0
                anchors.leftMargin: -12
                anchors.topMargin: 116
                anchors.fill: parent
                acq: acq
            }

            Image {
                id: chaosLogo
                x: -12
                y: 0
                width: 106
                height: 100
                antialiasing: true
                fillMode: Image.PreserveAspectFit
                source: "images/images/chaos_logo.png"
            }

        }
    }


    UvcAcquisition {
        id: acq
    }


    UvcVideoProducer {
        id: player
        uvc: acq
    }


}
