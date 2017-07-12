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

    UvcAcquisition {
        id: acq
    }

    UvcVideoProducer {
        id: player
        uvc: acq
    }

    RowLayout {
        spacing: 0
        anchors.fill: parent

        Pane {
            x: 0
            width: 510
            bottomPadding: 5
            rightPadding: 5
            leftPadding: 5
            topPadding: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            VideoOutput {
                id: videoOutput
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
                fillMode: Image.PreserveAspectFit
                source: "images/images/chaos_logo.png"
            }
        }
    }
}
