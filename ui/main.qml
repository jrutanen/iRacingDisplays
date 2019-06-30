import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtWinExtras 1.0


Window
{
    property var windowWidth: 2560
    property var windowHeight: 300
    property var subTitleMargin: 20

    id: resultWindow
    width: windowWidth
    height: windowHeight
    visible: true
    x: 20; y: Screen.height - windowHeight - 20

//    flags: Qt.WA_TranslucentBackground | Qt.FramelessWindowHint

    color: "#000000"
    title: qsTr("iRacingResults")

    QtObject {
        id: theme
        property font rowFont: Qt.font({
            family: 'Encode Sans',
            weight: Font.Normal,
            italic: true,
            pointSize: 16
        })
        property font speedoMeterBoldFont: Qt.font({
            family: 'Helvetica',
            weight: Font.Bold,
            italic: true,
            pointSize: 10
        })
        property font speedoMeterNormalFont: Qt.font({
            family: 'Helvetica',
            weight: Font.Normal,
            italic: true,
            pointSize: 9
        })
        property font lapNumberFont: Qt.font({
            family: 'Helvetica',
            weight: Font.Normal,
            italic: false,
            pointSize: 72
        })
        property font subTitleFont: Qt.font({
            family: 'Helvetica',
            weight: Font.Normal,
            italic: false,
            pointSize: 16
        })

    }

//    Button {
//        objectName: "OverlayModeButton"
//        signal overlayModeOn()
//        anchors.centerIn: parent
//        text: "Overlay Mode"
//        onClicked: overlayModeOn()
//    }

    PositionList {
        x: 0; y: 0
        width: 500
        height: parent.height
        anchors.right: parent.right
    }

//    SpeedoMeter {
//        id: instrumentSpeedoMeter
//        anchors {
//            left: parent.left
//            bottom: parent.bottom
//            leftMargin: 2000
//            bottomMargin: 10
//        }
//        implicitWidth: 500
//        implicitHeight: 300
//    }

//    RpmMeter {
//        id: instrumentRpmMeter
//        anchors {
//            left: parent.left
//            bottom: parent.bottom
//            leftMargin: 1725
//            bottomMargin: 10
//        }
//        implicitWidth: 500
//        implicitHeight: 300
//    }

//    Top {
//        width: parent.width
//        height: 150
//        anchors {
//            left: parent.left
//            top: parent.top
//            topMargin: 20
//        }
//    }
    WaitScreen {
        x: 0; y:0
        width: parent.width
        height: parent.height
    }


}

