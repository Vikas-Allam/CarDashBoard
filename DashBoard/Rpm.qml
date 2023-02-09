import QtQuick 2.15

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
Item {
        id: myGauge2

        property real size: 200;
        property real angle: 0
        property string  needleColor:"orange"
        x:400
        y:40

       width: size;
        height: size;

        Image {
            id: rpm

            source:"qrc:/Images/Rpm .png"


}
//        Image{
//            id:circle
//        anchors.centerIn: parent
//      //      y:89
//        //    x:93

//            source: "qrc:/Images/circle (1).png"
//            opacity: 100

//        }


//Rectangle {
//    id: background1
//    color: "transparent";

//    radius: myGauge2.size / 2;
//   // border.color: "black";
//    border.width: 5;


Rectangle {
    id: needle2

    property real len: myGauge2.size/ 2.0 * 0.85;
    property real w: 10;

    color: myGauge2.needleColor
    width: w-5;
    height: len
    antialiasing: true;
  opacity: 0.5
    transform: [
        Rotation { origin.x: 7; origin.y: 6; angle: myGauge2.angle+49; }
        , Translate { x: myGauge2.size / 2.0 - (needle2.w-5)/ 2.0; y: myGauge2.size / 2.0 - (needle2.w-5) / 2.0 }
    ]
}
//                }
}

