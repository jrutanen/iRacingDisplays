import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.12

Item
{
    id: topBar
    width: parent.width
    height: parent.height
    x: 0; y: 10

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#99000000"

        RowLayout {
            anchors.left: parent.left
            anchors.top: parent.top
            height: parent.height
            width: parent.width
            Rectangle {
                id: drvierInfo
                width: 400
                height: parent.height
                color: "#00000000"
                anchors.left: parent.left
            }
            Rectangle {
                id: positionAndLapInfo
                color: "#00000000"
                width: 200
                height: parent.height
                anchors.centerIn: parent
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: subTitleMargin
                    font: theme.subTitleFont
                    color: "white"
                    text: "LAP";
                }
                Text {
                    objectName: "LapInfo"
                    id: lapInfo
                    property var totalLaps: 1
                    property var currentLap: 1
                    property var lapInfoText: currentLap + " / " + totalLaps
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    font: theme.lapNumberFont
                    color: "white"
                    text: lapInfoText;
                    function lapChanged (current, total) {
                        //console.log("lapChanged called");
                        currentLap = current;
                        totalLaps = total;
                        lapInfoText = currentLap + "/" + totalLaps;
                    }
                }
            }
            Rectangle {
                id: weatherInfo
                width: 400
                height: parent.height
                color: "#00000000"
                anchors.right: parent.right
                WindSock {
                    anchors.left: parent.left
                    anchors.top: parent.top
                }
                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: 125
                    anchors.top: parent.top
                    anchors.topMargin: subTitleMargin
                    font: theme.subTitleFont
                    color: "white"
                    text: "TEMPERATURE"
                }
            }
        }
    }

}
