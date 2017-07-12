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
    antialiasing: false
    property alias pane: pane
    property alias image: image

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

        CameraControls {
            Layout.minimumWidth: 240
            Layout.fillHeight: true
            acq: acq
        }

        Pane {
            x: 220
            width: 400
            bottomPadding: 5
            rightPadding: 5
            leftPadding: 5
            topPadding: 5
            Layout.fillWidth: true
            Layout.fillHeight: true
            Image {
                id: image
                x: 8
                y: 8
                width: 80
                height: 80
                sourceSize.height: 192
                sourceSize.width: 192
                fillMode: Image.PreserveAspectFit
                z: 3
                source: "images/chaos_logo.png"
            }

            VideoOutput {
                id: videoOutput
                anchors.fill: parent
                fillMode: VideoOutput.PreserveAspectFit
                source: player
            }
        }

        Pane {
            id: pane
            width: 130
            Layout.minimumWidth: 130
            Layout.fillHeight: true
            visible: acq.cci.supportsRadiometry

            RangeDisplay {
                anchors.fill: parent
                acq: acq
            }
        }
    }
}
