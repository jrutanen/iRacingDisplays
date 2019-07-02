import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import Position 1.0


Item
{
    id: positions
    width: parent.width
    height: parent.height
    anchors.right: parent.right
    anchors.rightMargin: 15


//    Gradient {
//        id: bgGradient
//        GradientStop { position: 0.0; color: "black" }
//        GradientStop { position: 0.2; color: "#4c3015" }
//        GradientStop { position: 0.75; color: "#4c3015" }
//        GradientStop { position: 0.88; color: "#b87333" }
//        GradientStop { position: 0.94; color: "#4c3015" }
//        GradientStop { position: 1.0; color: "black" }
//    }
//    Gradient {
//        id: bgGradient
//        GradientStop { position: 0.0; color: "black" }
//        GradientStop { position: 0.2; color: "red" }
//        GradientStop { position: 0.75; color: "red" }
//        GradientStop { position: 0.88; color: "#ffcccc" }
//        GradientStop { position: 0.94; color: "red" }
//        GradientStop { position: 1.0; color: "black" }
//    }
    Gradient {
        id: bgGradient
        GradientStop { position: 0.0; color: "#ffcccc" }
//        GradientStop { position: 0.2; color: "red" }
//        GradientStop { position: 0.75; color: "red" }
//        GradientStop { position: 0.88; color: "#ffcccc" }
//        GradientStop { position: 0.94; color: "red" }
        GradientStop { position: 1.0; color: "red" }
    }
//    Gradient {
//        id: positionGradient
//        GradientStop { position: 0.0; color: "black" }
//        GradientStop { position: 0.2; color: "#333333" }
//        GradientStop { position: 0.75; color: "#333333" }
//        GradientStop { position: 0.88; color: "#666666" }
//        GradientStop { position: 0.94; color: "#333333" }
//        GradientStop { position: 1.0; color: "black" }
//    }
    Gradient {
        id: positionGradient
        GradientStop { position: 0.0; color: "#333333" }
//        GradientStop { position: 0.2; color: "#333333" }
//        GradientStop { position: 0.75; color: "#333333" }
//        GradientStop { position: 0.88; color: "#666666" }
//        GradientStop { position: 0.94; color: "#333333" }
        GradientStop { position: 1.0; color: "black" }
    }
    Rectangle {
        id: positionAndLapInfo
//        gradient: positionGradient
        color: "black"
        width: parent.width
        border.color: "black"
        border.width: 0
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        Text {
            objectName: "LapInfo"
            id: lapInfo
            property var totalLaps: 1
            property var currentLap: 1
            property var lapInfoText: "LAP " + currentLap + " / " + totalLaps
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font: theme.subTitleFont
            color: "white"
            text: lapInfoText;
            function lapChanged (current, total) {
                //console.log("lapChanged called");
                currentLap = current;
                totalLaps = total;
                lapInfoText = "LAP " + currentLap + "/" + totalLaps;
            }
        }
    }
    Component {
        id: highlightComponent
        Rectangle {
            width: ListView.view.width
        }
    }

    Component {
        id: resultRow
        Item {
            property var rowHeight: 40
            property var columnMargin: 5
            property var textMargin: 13
            property var cornerRadius: 8
            property var textPadding: 3
            property int indexOfThisDelegate: index
            property var rowColor:
                (model.name === "Jani Rutanen") ? bgGradient : positionGradient
            height: rowHeight
            focus: (model.position === "10") ? true : false

            Rectangle {
                id: driverPosition
                width: 50; height: rowHeight
                border.color: "#666666"
                border.width: 1
//                radius: cornerRadius
                antialiasing: true
                gradient: rowColor
                anchors.left: parent.left

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignCenter
                    font: theme.rowFont
                    color: "white"
                    padding: textPadding
                    text: model.position
                }
            }
            Rectangle {
                id: driverName
                width: 295; height: rowHeight
                border.color: "#666666"
                border.width: 1
//                radius: cornerRadius
                antialiasing: true
                gradient: rowColor
                anchors.left: driverPosition.right
                anchors.leftMargin: columnMargin
                anchors.rightMargin: columnMargin

                Text {
                    anchors.left: parent.left
                    anchors.leftMargin: textMargin
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignLeft
                    padding: textPadding
                    font: theme.rowFont
                    color: "white"
                    text: model.name
                }
            }

            Rectangle {
                id: driverTime
                width: 145; height: rowHeight
                border.color: "#666666"
                border.width: 1
//                radius: cornerRadius
                antialiasing: true
                anchors.left: driverName.right
                anchors.leftMargin: columnMargin
                gradient: rowColor

                Text {
                    anchors.right: parent.right
                    anchors.rightMargin: textMargin
                    anchors.verticalCenter: parent.verticalCenter
                    padding: textPadding
                    horizontalAlignment: Text.AlignRight
                    font: theme.rowFont
                    color: "white"
                    text: model.time
                }
            }
        }
    }

    ListView
    {
        id: positionsList
        clip: true
        orientation: Qt.Vertical
        width: parent.width
        height: parent.height - 65
        anchors.top: positionAndLapInfo.bottom
        anchors.topMargin: 5
        spacing: 5
        snapMode: ListView.SnapToItem
        highlight: highlightComponent
        focus: true
        model: PositionModel {            
            list: positionList
        }
        delegate: resultRow
    }
}
