import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Window
{
    property var windowWidth: Screen.width
    property var windowHeight: Screen.height
    property var subTitleMargin: 20
    id: resultWindow
    width: windowWidth
    height: windowHeight
    visible: true
    x: 0
    y: Screen.height - windowHeight
    flags: Qt.WA_TranslucentBackground | Qt.FramelessWindowHint

    color: "#00000000"
    title: qsTr("iRacingResults")

    QtObject {
        id: theme
        property font rowFont: Qt.font({
            family: 'Encode Sans',
            weight: Font.Normal,
            italic: true,
            pointSize: 13
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

    PositionList {
        width: 500
        height: 600
        anchors {
            left: parent.left
            bottom: parent.bottom
            leftMargin: 10
            bottomMargin: 10
        }
    }

    SpeedoMeter {
        id: instrumentSpeedoMeter
        anchors {
            left: parent.left
            bottom: parent.bottom
            leftMargin: 2000
            bottomMargin: 10
        }
        implicitWidth: 500
        implicitHeight: 300
    }

    RpmMeter {
        id: instrumentRpmMeter
        anchors {
            left: parent.left
            bottom: parent.bottom
            leftMargin: 1725
            bottomMargin: 10
        }
        implicitWidth: 500
        implicitHeight: 300
    }

    Top {
        width: parent.width
        height: 150
        anchors {
            left: parent.left
            top: parent.top
            topMargin: 20
        }
    }
}
