import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
Window {
  id:root
    visible: true
    width: 640
    height: 480

    color: "transparent";
  property int cnt: 0
    property variant win
    property string  bgColor: "black"
    property string  fontColor: "orange"
    property string  needleColor: "orange"
    property int  count
    property int  count1: 0
    property int  secCnt: 0
    property string  fromMain
    property string blinker
    property real pAngle: 0
    property string  speed: "0"
   property alias  dashColor: r1.color

                           Rectangle
                            {
                                id:r1
                                anchors.fill:parent
                             color: root.bgColor
                             opacity: 2
                            SpeedoMeter {
                                id: myGauge

                                needleColor: root.needleColor
                                onAngleChanged: spinBox.text = angle
                            }
                            Rpm
                            {
                                id:myRpm
                                  needleColor: root.needleColor
                            }

                            Label{
                                id:spinBox
                                color: root.fontColor
                                opacity:1
                                font.bold:true
                                font.pointSize: 8
                                x:158
                                y:101
                            }
                           Label{
                               id:spinBox2
                               color: root.fontColor
                               text: "0"
                               opacity: 2
                               x:480
                               y:100
                           }
                           Label{
                               id:rpm
                               color: root.fontColor
                               text: "rpm"
                               opacity: 2
                               x:490
                               y:100
                           }




                               Image {
                                   id: car
                                   source: "qrc:/Images/car.png"
                                       x:280
                                       y:140

                               }

                               Text {
                                   id: dot
                                   text: qsTr("-----")
                                   color: "white"
                                   x:320
                                   y:150
                               }



                               Text {
                                   id: hour
                                   text:"0"
                                   color: root.fontColor
                                   x:290
                                   y:110
                               }
                               Text
                                  {
                                      id: colon
                                      text:"H :"
                                      color: root.fontColor
                                      x:305
                                      y:110

                               }
                               Text {
                                   id: minute
                                   text:""
                                   color:root.fontColor
                                   x:325
                                   y:110
                               }
                               Text
                                  {
                                      id: min
                                      text:"M :"
                                      color: root.fontColor
                                      x:340
                                      y:110

                               }

                               Text{
                                   id:second
                                   text: ""
                                   x:365
                                   y:110
                                   color:root.fontColor
                               }
                               Text{
                                   id:sec
                                   text: "S"
                                   x:385
                                   y:110
                                   color:root.fontColor
                               }


                               Image {
                                   id: display
                                   source: "qrc:/Images/image (3).png"

                                   x:250
                                   y:40
                                  }




                                 Label
                               {
                                   id:temp
                                   color: "white"
                                   width: 10
                                   height: 10
                                   text: "10"



                                   x:260
                                   y:50
                               }

                               Label
                        {
                                   id:time
                                   color: "white"
                                   width:20
                                   height: 20
                                   x:380
                                   y:50

                               }
                               Timer{
                                   id:timer1
                                   interval: 1000
                                   repeat: true
                                   running: false
                                   onTriggered: {




                                   liblink.start()


                                   }
                               }
                               Timer{
                                   id:timer2
                                   interval: 1000
                                   repeat: true
                                   running: false
                                   onTriggered: {




                                   riblink.start()

                                   }
                                   }
                               Label
                               {
                                   id:distance
                                   color: root.fontColor
                                   font.pointSize: 12
                                   x:345
                                   y:150
                                   font.bold:true
                               }


 /*----------------------------------------------------Steering---------------------------------------------------------*/


                               Image{
                                   id:steer
                                   source: "qrc:/Images/Steering.png"
                                   x:310
                                   y:370
                                   Rectangle
                                   {
                                    anchors.fill: parent
                                       color: "transparent"
                                   MouseArea{
                                       anchors.fill: parent
                                       onClicked: {
                                           console.log("steering")
                                           var component = Qt.createComponent("Steering.qml")
                                            win    = component.createObject(root)
                                       //    root.close();

                                                      win.show();



                                           }


                                       }
                                   }
                               }


/*------------------------------------------------------Parking----------------------------------------------------------------*/
                                Rectangle{
                                    id:rect1

                                    x:295
                                    y:45
                                    width:20
                                    height: 20
                                    radius: 25
                                    color: "transparent"
                                    border.width: 3
                                    border.color: "orange"
                                    opacity: 0.5
                                    Text {
                                        id: parking
                                        text: "P"
                                        color: root.fontColor
                                        opacity: 0.5
                                        anchors.centerIn: parent
                                        font.pointSize: 10
                                        font.bold: true
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked:
                                        {
                                            rect1.color="green"
                                            root.blinker="Park"
                                            testing.stopTimer("1")

                                    }
                                }
}

                          }




/*----------------------------------------------------------------Indicators----------------------------------------------------------------*/
                              Image{
                              id:li
                              source: "qrc:/Images/LI.png"
                              x:180
                              y:370
                              Rectangle
                              {

                                 anchors.fill: parent
                                     color: "transparent"

                                  MouseArea{
                                      anchors.fill: parent
                                     onClicked: {

                                         timer1.running=true
                                     timer2.running=false

                                     }
                                  }
                              }

                                PropertyAnimation {
                                    id: liblink;
                                    target: li;
                                    alwaysRunToEnd: true;
                                    property: "opacity";

                                    to: 0;
                                    duration: 100
                                    onStopped: animationli.start()
                                }

                                PropertyAnimation {
                                    id: animationli;
                                    target: li;
                                    alwaysRunToEnd: true;
                                    property: "opacity";
                                    //from: 100
                                    to:1;
                                    duration:100
                                }


                              }



                              Image{
                              id:ri
                              source: "qrc:/Images/RI.png"
                                x:450
                                y:370
                                Rectangle
                                {

                                   anchors.fill: parent
                                       color: "transparent"

                                    MouseArea{
                                        anchors.fill: parent
                                       onClicked: {

                                          timer2.running=true
                                           timer1.running=false


                                       }
                                    }
                                }

                                PropertyAnimation {
                                    id: riblink;
                                    target: ri;
                                 //   alwaysRunToEnd: true;
                                    property: "opacity";

                                    to: 0;
                                    duration: 100
                                    onStopped: animationTwo.start()
                                }

                                PropertyAnimation {
                                    id: animationTwo;
                                    target: ri;
                                 //   alwaysRunToEnd: true;
                                    property: "opacity";
                                    //from: 100
                                    to:1;
                                    duration:100
                                }

                              }




/*-----------------------------------------------------------------------PetrolIndicator-----------------------------------------------------------------------------*/
                            Image {
                                id: petrolin
                                source: "qrc:/Images/PetrolIndicator .png"
                                x:280
                                y:220
                                Image {
                                    id: petrol
                                    source: "qrc:/Images/petrolsymbol.png"

                              anchors.centerIn: parent
                              Label{
                                  id:fuel
                                  color: root.fontColor
                                  width: 10
                                  height: 10
                                  text: "50"
                                  anchors.top: parent.top
                                  font.pointSize: 10
                                  anchors.left: parent.right



                              }

                              Text {
                                  id: dot2
                                  text: qsTr("  L")
                                  color: root.fontColor
                                  font.pointSize: 10
                                  anchors.left: fuel.right
                                  anchors.right: petrolin.left

                              }

                              PropertyAnimation {
                                  id: petrolblink;
                                  target: petrol;
                                  alwaysRunToEnd: true;
                                  property: "opacity";

                                  to: 0;
                                  duration: 100
                                  onStopped: animationpetrol.start()
                              }

                              PropertyAnimation {
                                  id: animationpetrol;
                                  target: petrol;
                                  alwaysRunToEnd: true;
                                  property: "opacity";
                                  //from: 100
                                  to:1;
                                  duration:100
                              }
                                }

                                Rectangle {
                                    id: background
                                    color: "blue";
                                    radius: myGauge.size / 2;
                                    border.color: "black";
                                    border.width: 5;


                                Rectangle {
                                    id: needle

                                    property real len: myGauge.size/ 2.0 * 0.85-20;
                                    property real w: 10;

                                    color: root.needleColor
                                    opacity: 0.5
                                    width: w-5;
                                    height: len
                                    antialiasing: true;

                                    transform: [
                                        Rotation { origin.x: 0; origin.y: 0; angle: root.pAngle+152; }
                                        , Translate { x: (myGauge.size / 2.0 - needle.w / 2.0)-30; y: myGauge.size / 2.0 - needle.w / 2.0 }
                                    ]
                                }
                                                }



}

                            Button
                            {
                              width:40
                              height:30
                              background: color="black"

                              Text
                              {
                                  text:"<-"
                                  color: "orange"
                                  font.bold: true
                                  font.pointSize: 20
                                  anchors.fill: parent
                                  clip: true
                              }

                            onClicked: {
                                var component = Qt.createComponent("main.qml")
                                 win    = component.createObject(root)


                                    //   root.close()
                                          win.show()
                            }

                            }


 /*-----------------------------------------------------------------------Connections-----------------------------------------------------------------------*/
                        Connections{
                            target: testing


                            onNotice:
                            {
                               myGauge.angle=data

                          root.speed=data;
                               distance.text= testing.totalDistance()

                    }
                            onNotice2:
                            {
                                    myRpm.angle=data2;


                                if(( data2)%35==0)
                                {

                                         cnt++;

                                     spinBox2.text=cnt
                                }


                            }
                            onTemperature:
                            {
                                temp.text=data4
                            }
                            onLevel:
                            {

                                  root.pAngle=root.pAngle+2
                                fuel.text=data3
                               if(data3==="Low")
                                {

                                    petrolblink.start()
                                    petrol.source="qrc:/Images/Symbol(R).png"
                                   testing.stopTimer("1")
                                }
                            }
                            onTime:
                            {

                                time.text=data5
                            }

                                onEngine:{
                                    if(root.fromMain==="ok")
                                    {

                                                console.log(root.bgColor)
                                        if(data6==="Min")
                                        {
                                            count++;
                                           minute.text=count

                                        }

                                       if(data6==="Hour")
                                       {
                                           count1++;
                                          hour.text=count1
                                       }

                                     second.text=data6

                                    }
                                }

                                onBlinkernotice:{

                                    if(root.blinker==="Park")
                                    {
                                    if(data7==="Blink1")
                                    {

                                        liblink.start()


                                    }
                                    if(data7==="Blink2")
                                    {


                                        riblink.start()
                                    }

                                }
                                    if(data7==="ReStart")
                                    {
                                        root.blinker="ReStart"

                                    }
                                    if(root.blinker==="ReStart")
                                    {
                                        console.log("ReStart")
                                        rect1.color="black"
                                        root.blinker="start"

                                       testing.startTimer()

                                    }

                                }
                                onSteernotice:
                                {
                                    if(data9==="left")
                                    {
                                        timer1.running=true
                                    timer2.running=false
                                    }
                                    if(data9==="right")
                                    {
                                        timer1.running=false
                                    timer2.running=true
                                    }
                                }
                                onStartnotice:
                                {
                                    if(data8>=0)
                                    {
                                        root.count=data8
                                        minute.text=data8
                                    }
                                    if(data8==="sent")
                                    {
                                        win.min=minute.text
                                        win.hour=hour.text
                                        win.speed=spinBox.text
                                        win.sec=second.text
                                        root.close()
                                    }
                                }
                                onHour:
                                {
                                    root.count1=data10
                                    hour.text=data10;
                                }
                                onNeedlecolor:
                                {
                                    root.needleColor=color1

                                }
                                onBackcolor:
                                {
                                    root.bgColor=color3
                                }
                                onFontcolor:
                                {
                                    root.fontColor=color2
                                }



        }

}



