import QtQuick 2.15

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

        Item {
                id: myGauge

                property real size: 200;
                property real angle: 0
                property string needleColor: "orange"
                x:80
                y:40

               width: size;
                height: size;


                        Image {
                                    id: speedometer
                                    source:"qrc:/Images/Speedometer.png"

//                                    Image{
//                                        id:circle
//                                   anchors.centerIn: parent
//                                 //       y:87.5
//                                   //     x:91.5
//                                        source: "qrc:/Images/circle (1).png"
//                                        opacity: 100

//                                    }

                        }

//                Rectangle {
//                    id: background
//                  color:myGauge.bgcolor;
//                    radius: myGauge.size / 2;
//                    border.color: "black";
//                    border.width: 5;


                Rectangle {
                    id: needle

                    property real len: myGauge.size/ 2.0 * 0.85;
                    property real w: 10;

                    color: myGauge.needleColor
                    opacity: 0.5
                    width: w-5;
                    height: len
                    antialiasing: true;

                    transform: [
                        Rotation { origin.x: 7; origin.y: 6; angle: myGauge.angle+49; }
                        , Translate { x: myGauge.size / 2.0 - needle.w / 2.0; y: myGauge.size / 2.0 - needle.w / 2.0 }
                    ]
                }
       //                         }
     }



