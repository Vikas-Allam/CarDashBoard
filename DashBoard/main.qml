import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3
import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Window {
id:root
    width: 480
    height: 480
    visible: true
    title: qsTr("Hello World")
    color:"black"
    property variant win

    property string  value
    property string fromDataSender
    property int  cnt: 0;
    property string  engineData;
    property string  min:"0"
    property string  hour:"0"

    property string  sec:"0"
    property int count :0
     property int count1 :0
    property string  speed:"0"
    property string  save
    property string  dbMin
    property string  bColor:"black"
    property string  nColor:"orange"
    property  string  fColor:"orange"
    Connections
    {
    target: testing
onStartnotice:{
    if(data8==="start")
    {

        testing.startTimer()

       value="ok"
        var component = Qt.createComponent("Display.qml")
         win    = component.createObject(root)

           win.bgColor=root.bColor
        win.fontColor=root.fColor
        win.needleColor=root.nColor
        win.fromMain=root.value
        root.close();

        win.show();

    }


    }


}


    Rectangle{
        id:startRect
        width:200
        height: 200
        radius: 120
        opacity: 1
        anchors.centerIn: parent
        color: "transparent"
          border.color: "white"
          border.width: 7
        Text {
            id: start

            text: qsTr("START")
            color: "white"
            font.pointSize: 12
            anchors.centerIn: parent
            font.bold: true
        }
        Text
        {
            id:text1
            anchors.top:  start.bottom
            anchors.left: start.left
            anchors.right: start.right
            text: "POWER"
            font.pointSize: 7
            font.bold: true
            color: "white"
        }
        Label{
   id:display
   text: "0"
   anchors.top:  text1.bottom
   anchors.left: text1.left
   anchors.right: text1.right
   color: "orange"
   font.pointSize: 15
   font.bold: true

        }
        Timer{
            id:timer
            interval: 1000
            repeat: true
            running: true
            onTriggered: {

       if(fromDataSender=="ok")
       {
         cnt++;
           if(cnt>=5)
           {
             timer.stop()
           }
             display.text=cnt
            }
        }
}
        MouseArea{
            anchors.fill: parent
            onClicked:
            {
                var person=database.accessSelectedperson()
               var data=[]
                data=database.accessSelectedUser(person)//testing.defaultDashBoard()
                console.log(data)

                root.nColor=data[1]
                root.bColor=data[2]
                root.fColor=data[3]

                testing.dBData()
             dbMin=testing.totalMIn()
                var cnt;
            cnt=  testing.startButton()


            fromDataSender=cnt;
                poplabel.text="Start"



                popup.open()

            }
            onPressAndHold:

            {


                console.log("DoubleClicked")

                poplabel.text="Stop"
                popup.open()



            }
        }
    }

    Popup
    {
   id:popup
   x: 100
   y: 100
   width: 150
   height: 150
   modal: true
   focus: true
   closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
   background: Rectangle {

       opacity: 0.5
       border.color: "black"
       border.width: 1
       radius: 2
       color: "white"
   }
   Text
   {
       id:poplabel
       text:qsTr("")
       color:"red"
       font.pointSize: 15
       font.bold: true
       anchors.centerIn: parent
       clip: true
   }

   Button{
       id:popbutton
       text: "ok"
       x:80
       y:150
       background: Rectangle {
           implicitWidth: 80
           implicitHeight: 40
           opacity: 0.5
           border.color: "black"
           border.width: 1
           radius: 2
           color: "red"
       }
        onClicked:{
         popup.close()

       }
        onPressAndHold:
        {
            testing.toDisplay("sent")

            if(root.hour==="0")
            {
                console.log("min")
                root.speed=(root.speed)*(5/18)*(root.min-root.dbMin)*60
                console.log(root.speed)
                database.getdata(hour,min,sec,speed)


            }
            if((root.min>"0")&&(root.hour>"0"))
            {
                console.log("hour")
                root.speed=(root.speed)*(5/18)*(root.hour-root.dbMin)*60
                database.getdata(hour,min,sec,speed)

            }

            testing.stopTimer("1")

              popup.close()
        }


}
}
}



