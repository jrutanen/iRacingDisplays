import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Shapes 1.12

Item
{
    id: rpmmeter
    Rectangle
    {
        id: rpmMeterPanel
        x: 0
        y: 20
        width: 250
        height: 250
        antialiasing: true
        radius: 125
        color: "#dbe4eb"
        Rectangle
        {
            anchors.centerIn: parent
            width: 250
            height: 250
            antialiasing: true
            radius: 125
            color: "black"
            opacity: 0.5
        }
        Rectangle
        {
            anchors.centerIn: parent
            width: 247
            height: 247
            antialiasing: true
            radius: 123.5
            color: "#dbe4eb"
        }
        Rectangle
        {
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -1
            anchors.verticalCenterOffset: 0.75
            width: 236
            height: 236
            antialiasing: true
            radius: 117.5
            color: "#d2d9db"
        }
        Rectangle
        {
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 1
            anchors.verticalCenterOffset: -0.75
            width: 236
            height: 236
            antialiasing: true
            radius: 117.5
            color: "#050000"
        }
        Rectangle
        {
            anchors.centerIn: parent
            width: 235
            height: 235
            antialiasing: true
            radius: 117.5
            color: "#333333"
            Shape {
                antialiasing: true
                anchors.centerIn: parent
                width: 235
                height: 235
                ShapePath {
                    property var lineWidth: 14
                    property var offset: (lineWidth/2) + 6
                    strokeColor: "#cc0000"
                    fillColor: "#00000000"
                    strokeStyle: ShapePath.DashLine
                    dashPattern: [0.15, 0.785]
                    strokeWidth: lineWidth
                    capStyle: ShapePath.FlatCap
                    startX: 40; startY: 175
                    PathArc {
                        x: 195; y: 175
                        radiusX: 96.5; radiusY: 96.5
                        useLargeArc: true
                    }
                }
                ShapePath {
                    property var lineWidth: 28
                    property var offset: (lineWidth/2) + 6
                    strokeColor: "#ffffff"
                    fillColor: "#00000000"
                    strokeStyle: ShapePath.DashLine
                    dashPattern: [0.15, 1.7176]
                    strokeWidth: lineWidth
                    capStyle: ShapePath.FlatCap
                    startX: 40; startY: 175
                    PathArc {
                        x: 195; y: 175
                        radiusX: 96.5; radiusY: 96.5
                        useLargeArc: true
                    }
                }
            }
            Text {
                font.family: "Helvetica";
                font.pointSize: 13
                color: "red"
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 70
                text: "RPM"
            }
            Text {
                font.family: "Helvetica";
                font.pointSize: 8
                color: "red"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 2
                anchors.verticalCenterOffset: 87
                text: "x100"
            }
            Text {
                x: 55; y: 151
                font: theme.speedoMeterBoldFont
                color: "white"
                text: "0"
            }
            Text {
                x: 40; y: 115
                font: theme.speedoMeterNormalFont
                color: "white"
                text: "20"
            }
            Text {
                x: 47; y: 77
                font: theme.speedoMeterBoldFont
                color: "white"
                text: "40"
            }
            Text {
                x: 66; y: 50
                font: theme.speedoMeterNormalFont
                color: "white"
                text: "60"
            }
            Text {
                x: 102; y: 37
                font: theme.speedoMeterBoldFont
                color: "white"
                text: "80"
            }
            Text {
                x: 142; y: 50
                font: theme.speedoMeterNormalFont
                color: "white"
                text: "100"
            }
            Text {
                x: 158; y: 77
                font: theme.speedoMeterBoldFont
                color: "white"
                text: "120"
            }
            Text {
                x: 171; y: 113
                font: theme.speedoMeterNormalFont
                color: "white"
                text: "140"
            }
            Text {
                x: 154; y: 151
                font: theme.speedoMeterBoldFont
                color: "white"
                text: "160"
            }

        }
        InstrumentNeedle {
            objectName: "RpmMeterNeedle"
            id: rpmNeedle
            property bool animRunning: false
            property var needleRotation: -125
            property var minRotation: -125
            property var maxRotation: 124
            property var minRpm: 0
            property var maxRpm: 16000
            property var newRotation: -125
            property var step: (maxRotation - minRotation)/(maxRpm)
            function rpmChanged (rpm) {
                if (rpmNeedle.animRunning) {
                    rpmNeedle.animRunning = false;
                    rpmNeedle.needleRotation = newRotation;
                }
                newRotation = minRotation + rpm * step;
                rpmNeedle.animRunning = true;
            }
            RotationAnimator on rotation {
                from: rpmNeedle.needleRotation;
                to: rpmNeedle.newRotation;
                duration: 998
                running: rpmNeedle.animRunning
            }
            x: 0
            y: 0
            width: 250
            height: 250
            transformOrigin: Item.Center
            rotation: maxRotation
        }
        Shape {
            antialiasing: true
            opacity: 0.4
            x: 7
            y: 4
            width: 250
            height: 250
            ShapePath {
                strokeColor: "#000000"
                strokeWidth: 0
                fillColor: "#000000"
                capStyle: ShapePath.RoundCap
                startX: 8; startY: 145
                PathArc {
                    x: 230; y: 135
                    radiusX: 120; radiusY: 100
                }
            }
            ShapePath {
                strokeColor: "#000000"
                strokeWidth: 0
                fillColor: "#000000"
                capStyle: ShapePath.RoundCap
                startX: 8; startY: 145
                PathArc {
                    direction: PathArc.Counterclockwise
                    x: 230; y: 135
                    radiusX: 113; radiusY: 112
                }
            }
        }
    }
}
