import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Shapes 1.12

Rectangle {
    objectName: "WaitSpinner"
    id: waitScreen
    x: 0; y:0
    width: parent.width
    height: parent.height
    color: "black"
    visible: true

    property var skippyRadius: 100
    property var skippyWidth: skippy.sourceSize.width
    property var skippyHeight: skippy.sourceSize.height

    Item
    {
        id: waitscreen
        visible: true
        width: parent.width
        height: parent.height

        Image {
            id: skippy
            source: "qrc:/ui/images/skippy.png"
            x: windowWidth / 2 - skippyRadius - skippyWidth/2
            y: windowHeight / 2 - skippyHeight/2
            transformOrigin: Item.Center

            SequentialAnimation {
                running: true
                loops: Animation.Infinite
                ParallelAnimation {
                    PathAnimation {
                        target: skippy
                        path: Path {
                            startX: waitScreen.width / 2 - skippyRadius - skippyWidth/2; startY: waitScreen.height / 2 - skippyHeight/2
                            PathArc {
                                relativeX: skippyRadius; relativeY: -skippyRadius
                                radiusX: skippyRadius; radiusY: skippyRadius;
                            }
                            PathArc {
                                relativeX: skippyRadius; relativeY: skippyRadius
                                radiusX: skippyRadius; radiusY: skippyRadius;
                            }
                            PathArc {
                                relativeX: -skippyRadius; relativeY: skippyRadius
                                radiusX: skippyRadius; radiusY: skippyRadius;
                            }
                            PathArc {
                                relativeX: -skippyRadius; relativeY: -skippyRadius
                                radiusX: skippyRadius; radiusY: skippyRadius;
                            }
                        }
                        duration: 2000
                    }
                    RotationAnimation {target: skippy; from: 0; to: 360; duration: 2000}
                }
            }
        }
        Text {
            id: info
            x: (windowWidth / 2) - contentWidth/2
            y: (windowHeight / 2) - contentHeight/2
            text: "WAITING\nFOR\niRACING"
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 18
            SequentialAnimation on color {
                loops: Animation.Infinite
                ColorAnimation { from: "#ffffff"; to: "#000000"; duration: 1250}
                ColorAnimation { from: "#000000"; to: "#ffffff"; duration: 1500}
            }

        }
    }
    function connected () {
        if (waitScreen.visible === true)
        {
            waitScreen.visible = false;
        }
    }
    function disconnected () {
        if (waitScreen.visible === false)
        {
            waitScreen.visible = true;
        }
    }
}
