import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Shapes 1.12

Item
{
    id: instrumentNeedle
    Rectangle
    {
        anchors.centerIn: parent
        id: needleBase
        width: 50
        height: 50
        antialiasing: true
        radius: 25
        color: "#020202"
        border.color: "#ffffff"
        border.width: 1
    }
    Shape {
        property var length: 60
        antialiasing: true
        anchors.centerIn: parent
        width: 250
        height: 250
        ShapePath {
            strokeWidth: 1
            strokeColor: "#aa000000"
            fillColor: "white"
            startX: 120; startY: 115
            PathLine {relativeX: 10; relativeY: 0}
            PathLine {relativeX: -4; relativeY: -90}
            PathLine {relativeX: -2; relativeY: 0}
            PathLine {relativeX: -4; relativeY: 90}
        }
    }
}
