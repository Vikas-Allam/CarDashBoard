import QtQuick 2.15
import QtQuick.Controls 2.3
import QtMultimedia
import QtPositioning 6.4
Window {
    id:steeringroot
    visible: true
    width: 640
    height: 480

    property variant win
    property string  name: "grey"
    property string left:"pok"
    property string  right:""
    color: "transparent";

                            Rectangle
                            {
                            anchors.fill:parent
                                color: "black"
                            }

                            Image {
                                id: steer
                            anchors.centerIn: parent
                                source: "qrc:/Images/steer (2).png"



                                    Rectangle
                                    {
                                        x:200
                                        y:100
                                        width: 40
                                        height: 40
                                        radius: 15
                                   color: "transparent"
                                        border.color: "white"
                                        Image {
                                            id: bluetooth
                                            source: "qrc:/Images/Bluetooth (3).png"
                                            anchors.centerIn: parent
                                        }

                                    }

                                    Rectangle
                                    {
                                        x:250
                                        y:100
                                        width: 40
                                        height: 40
                                        radius: 15
                                   color: "transparent"
                                        border.color: "white"
                                        Image {
                                            id: navigate
                                            source: "qrc:/Images/Navigate (1).png"

                                            anchors.centerIn: parent

                                        }
                                        Text {
                                            id: navi
                                            text: qsTr("Navi")
                                            anchors.top: navigate.bottom
                                            anchors.left: navigate.left
                                            anchors.right: navigate.right
                                         color:"white"
                                         font.pointSize: 5
                                         font.bold: true
                                        }

                                    }
                                    Rectangle
                                    {
                                        x:300
                                        y:100
                                        width: 40
                                        height: 40
                                        radius: 15
                                   color: "transparent"
                                        border.color: "white"
                                        Image {
                                            id: radio
                                            source: "qrc:/Images/Radio (1).png"

                                            anchors.centerIn: parent

                                        }


                                    }
                                    Rectangle
                                    {
                                        x:200
                                        y:150
                                        width: 40
                                        height: 40
                                        radius: 15
                                   color: "transparent"
                                        border.color: "white"
                                        Image {
                                            id: music
                                            source: "qrc:/Images/Music .png"
                                            anchors.centerIn: parent

                                        }


                                    }
                                    Rectangle
                                    {
                                        x:250
                                        y:150
                                        width: 40
                                        height: 40
                                        radius: 15
                                   color: "transparent"
                                        border.color: "white"
                                        Image {
                                            id: apps
                                            source: "qrc:/Images/Apps .png"
                                            anchors.centerIn: parent
                                        }


                                    }
                                    Rectangle
                                    {
                                        x:300
                                        y:150
                                        width: 40
                                        height: 40
                                        radius: 15
                                   color: "transparent"
                                        border.color: "white"
                                        Image {
                                            id: horn
                                            source: "qrc:/Images/Horn (1).png"
                                            anchors.centerIn: parent
                                        }
                                             SoundEffect {
                                        id: playSound
                                        source: "qrc:/sound/air_horn.wav"
                                    }
                                    MouseArea {
                                        id: playArea
                                        anchors.fill: parent
                                        onPressed: {
                                        console.log("play")
                                            playSound.play()
                                        }
                                    }


                                    }


                                Rectangle
                                {
                                    x:135
                                    y:235
                                   width: 20
                                   height: 20
                                    color: "transparent"
                                    opacity: 0.5
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {

                                      testing.fromSteering("left")
                                }
                                }
                                }
                                Rectangle
                                {
                                    x:405
                                    y:235
                                   width: 20
                                   height: 20
                                    color: "transparent"
                                    opacity: 0.5
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {

                                              console.log("right")
                                            testing.fromSteering("right")


                                        }
                                    }

                                }
Rectangle{
    x:340
    y:315
    width: 40
    height: 40
     color: "transparent"
     opacity: 0.5
     MouseArea{
         anchors.fill: parent
         onClicked: {
             var component = Qt.createComponent("CarSettings.qml")
              win    = component.createObject(root)

                        win.show();
}

}
}




}





}
