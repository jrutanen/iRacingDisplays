import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Shapes 1.12

Item
{
    id: lapTimes
    objectName: "LapTimes"
    property var bestLap: "00:00.000"
    property var lastLap: "00:00.000"
    function lapTimesChanged (best, last) {
        bestLap = best;
        lastLap = last;
    }

    Text {
        id: bestLapTitle
        anchors.top: parent.top
        anchors.topMargin: subTitleMargin
        font: theme.subTitleFont
        color: "white"
        text: "BEST LAP"
    }

    Text {
        id: bestLap
        anchors.top: bestLapTitle.bottom
        anchors.topMargin: 5
        font: theme.subTitleFont
        color: "white"
        text: lapTimes.bestLap
    }

    Text {
        id: lastLapTitle
        anchors.top: bestLap.bottom
        anchors.topMargin: subTitleMargin
        font: theme.subTitleFont
        color: "white"
        text: "LAST LAP"
    }

    Text {
        id: lastLap
        anchors.top: lastLapTitle.bottom
        anchors.topMargin: 5
        font: theme.subTitleFont
        color: "white"
        text: lapTimes.lastLap
    }
}
