import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import Position 1.0


Item
{
    id: positions
    width: parent.width
    height: parent.height

//    Gradient {
//        id: bgGradient
//        GradientStop { position: 0.0; color: "black" }
//        GradientStop { position: 0.2; color: "#4c3015" }
//        GradientStop { position: 0.75; color: "#4c3015" }
//        GradientStop { position: 0.88; color: "#b87333" }
//        GradientStop { position: 0.94; color: "#4c3015" }
//        GradientStop { position: 1.0; color: "black" }
//    }
    Gradient {
        id: bgGradient
        GradientStop { position: 0.0; color: "black" }
        GradientStop { position: 0.2; color: "red" }
        GradientStop { position: 0.75; color: "red" }
        GradientStop { position: 0.88; color: "#ffcccc" }
        GradientStop { position: 0.94; color: "red" }
        GradientStop { position: 1.0; color: "black" }
    }
    Gradient {
        id: positionGradient
        GradientStop { position: 0.0; color: "black" }
        GradientStop { position: 0.2; color: "#333333" }
        GradientStop { position: 0.75; color: "#333333" }
        GradientStop { position: 0.88; color: "#666666" }
        GradientStop { position: 0.94; color: "#333333" }
        GradientStop { position: 1.0; color: "black" }
    }
    Component {
        id: resultRow
        Item {
            property var rowHeight: 30
            property var columnMargin: 5
            property var textMargin: 13
            property var cornerRadius: 8
            property var textPadding: 3
            property var rowColor:
                (model.name === "Jani Rutanen") ? bgGradient : positionGradient
            height: rowHeight

            Rectangle {
                id: driverPosition
                width: 45; height: rowHeight
                radius: cornerRadius
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
                width: 240; height: rowHeight
                radius: cornerRadius
                antialiasing: true
                gradient: rowColor
                anchors.left: driverPosition.right
                anchors.leftMargin: columnMargin

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
                width: 95; height: rowHeight
                radius: cornerRadius
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
                    text: model.time.toFixed(3)
                }
            }
        }
    }

    ListView
    {
        id: positionsList
        clip: true
        orientation: Qt.Vertical
        width: parent.width - 10
        height: parent.height
        anchors.top: parent.top
//        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 2

        model: PositionModel {
            list: positionList
        }
        delegate: resultRow
    }
}
