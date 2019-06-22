import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Shapes 1.12

Item
{
    id: windSock
    objectName: "WindSock"
    property var windDirection: "0°"
    Text {
        id: title
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.top: parent.top
        anchors.topMargin: subTitleMargin
        font: theme.subTitleFont
        color: "white"
        text: "WIND"
    }

    Shape {
        id: ws
        //number of socks up
        property var up: 0
        property var pLength: 15
        property var pSlope: 3
        antialiasing: true
        anchors.left: parent.left
        anchors.top: title.bottom
        anchors.topMargin: 15
        width: 100
        height: 81
        ShapePath {
            id: pole
            strokeWidth: 4
            capStyle: ShapePath.RoundCap
            startX: 0; startY: 0
            PathLine {relativeX: 0; relativeY: 80 }
        }
        ShapePath {
            id: ropes
            strokeWidth: 1
            fillColor: "#00000000"
            capStyle: ShapePath.RoundCap
            startX: 0; startY: 0
            PathLine {relativeX: 7; relativeY: ws.pSlope }
            PathLine {relativeX: 0; relativeY: 50 }
            PathLine {relativeX: -7; relativeY: ws.pSlope }
        }
        ShapePath {
            id: bagOne
            strokeWidth: 0
            strokeColor: "orangered"
            fillColor: "orangered"
            capStyle: ShapePath.RoundCap
            startX: 7; startY: 3
            PathLine {relativeX: ws.pLength; relativeY: ws.pSlope}
            PathLine {relativeX: 0; relativeY: 45}
            PathLine {relativeX: -ws.pLength; relativeY: ws.pSlope}
        }
        ShapePath {
            id: bagTwo
            strokeWidth: 0
            strokeColor: "white"
            fillColor: "white"
            capStyle: ShapePath.RoundCap
            startX: bagOne.startX + ws.pLength; startY: 5
            PathLine {relativeX: ws.pLength; relativeY: ws.pSlope}
            PathLine {relativeX: 0; relativeY: 40}
            PathLine {relativeX: -ws.pLength; relativeY: ws.pSlope}
        }
        ShapePath {
            id: bagThree
            strokeWidth: 0
            strokeColor: "orangered"
            fillColor: "orangered"
            capStyle: ShapePath.RoundCap
            startX: bagTwo.startX + ws.pLength; startY: 8
            PathLine {relativeX: ws.pLength; relativeY: ws.pSlope}
            PathLine {relativeX: 0; relativeY: 35}
            PathLine {relativeX: -ws.pLength; relativeY: ws.pSlope}
        }
        ShapePath {
            id: bagFour
            strokeWidth: 0
            strokeColor: "white"
            fillColor: "white"
            capStyle: ShapePath.RoundCap
            startX: bagThree.startX + ws.pLength; startY: 11
            PathLine {relativeX: ws.pLength; relativeY: ws.pSlope}
            PathLine {relativeX: 0; relativeY: 30}
            PathLine {relativeX: -ws.pLength; relativeY: ws.pSlope}
        }
        ShapePath {
            id: bagFive
            strokeWidth: 0
            strokeColor: "orangered"
            fillColor: "orangered"
            capStyle: ShapePath.RoundCap
            startX: bagFour.startX + ws.pLength; startY: 14
            PathLine {relativeX: ws.pLength; relativeY: 3}
            PathLine {relativeX: 0; relativeY: 25}
            PathLine {relativeX: -ws.pLength; relativeY: 2}
        }
    }
    Text {
        anchors.top: ws.bottom
        anchors.left: parent.left
        anchors.leftMargin: 30
        font: theme.subTitleFont
        color: "white"
        text: windDirection
    }
}
