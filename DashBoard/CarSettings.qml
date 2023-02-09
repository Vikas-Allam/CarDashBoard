import QtQuick 2.15
import QtQuick.Controls 2.3

Window {
    id:settingsroot
    visible: true
    width: 500
    height: 380
    color: "black"



    Image {
        id: name
        source: "qrc:/Images/Ferrari (1).png"
        anchors.fill: parent
    }
    opacity: 1
    property string  selectedName
    property string  updateData
    Button
    {
        text:"Add New"
        x:100
        y:100
        onClicked: {
      popup.open()
        }
    }
    Button
    {
        text:"Users"
        x:300
        y:100
        onClicked: {
            var user=testing.userDefault()
            console.log("user"+user);



           var p=[]
           p=database.getPerson()


                p1.text=p[0]
                p2.text=p[1]
                p3.text=p[2]
                p4.text=p[3]
                p5.text=p[4]
            if(p1.text===user)
                rect1.color="green"
            if(p2.text===user)
                rect2.color="green"
             if(p3.text===user)
                 rect3.color="green"
             if(p4.text===user)
                 rect4.color="green"
             if(p5.text===user)
                 rect5.color="green"
                  viewpopup.open()

    }
    }
    Text
    {
        id:test
        text:""

    }

/*----------------------------------------------------------------------------UserNamePopup----------------------------------------------------------------*/
    Popup
    {
   id:popup
   x: 100
   y: 100
   width: 200
   height: 200
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

   TextField
  {
      id:buttontext

        clip: true
        anchors.centerIn: parent
        placeholderText: qsTr("New User")

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
       var id= database.getId()

            if(id>=5)
            {
                    decline.open()
                console.log("data full")
            }
            console.log(settingsroot.updateData)


            if(id<5)
            {
 console.log("else")
          popup2.open()

       }
}
}
}
    /*-----------------------------------------------------------------------------------------SettingsPopup-----------------------------------------------------------------*/
    Popup
    {
   id:popup2
   x: 100
   y: 100
   width: 300
   height: 200
   modal: true
   focus: true
   closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
   background: Rectangle {

       opacity: 0.8
       border.color: "black"
       border.width: 1
       radius: 2
       color: "white"
   }
   Label{
       text: "Needle  :"
       x:20
       y:20
   }
   Label{
       text: "BackGround  :"
       x:20
       y:60
   }
   Label{
       text: "Font Color :"
       x:20
       y:100
   }


   ComboBox {
       id: cobo1

       clip: true
 x:140
 y:20
       model:['','green','blue','red','brown','teal']
     Text
     {
         id:text1
         text: ""
         opacity: 5
         font.bold: true

     }


     onCurrentTextChanged:  {
         text1.text=" "

     }

   }

   ComboBox {
       id: cobo2
       clip: true
       x:140
       y:60
       model:['','gray','lavender','teal','silver','olive']
     Text
     {
         id:text2
         text: ""
         opacity: 5
         font.bold: true


     }


     onCurrentTextChanged:  {
         text2.text=" "

     }

   }

   ComboBox {
       id: cobo3

       clip: true
       x:140
       y:100
       model:['','green','blue','red','grey','lavender']
     Text
     {
         id:text3
         text: ""
         font.bold: true
         opacity: 5

     }
     onCurrentTextChanged:  {
         text3.text=" "

     }


   }


   Button{
       id:popbutton2
       text: "Save"
       x:80
       y:150
       background: Rectangle {
           implicitWidth: 80
           implicitHeight: 40
           opacity: 0.8
           border.color: "black"
           border.width: 1
           radius: 2
           color: "red"
       }
        onClicked:{
           console.log(buttontext.text)
            database.getSettings(buttontext.text,cobo1.currentText,cobo2.currentText,cobo3.currentText)

         popup2.close()
       popup.close()
         }

}
}
    /*-----------------------------------------------------------------------------------ViewPOpup-----------------------------------------------------------------*/
    Popup
    {
   id:viewpopup
   x: 300
   y: 100
   width: 200
   height: 400
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
Rectangle{
    id:rect1
    x:20
    y:70
    width:80
    height: 18
    color: "transparent"
  border.width: 1
  border.color: "skyblue"
Text
{
    id:p1
    text:""
    anchors.centerIn: parent

}
MouseArea{
    anchors.fill: parent
    onClicked:
    {
        rect1.color="green"
        rect2.color="transparent"

        rect3.color="transparent"
        rect4.color="transparent"
        rect5.color="transparent"
        settingsroot.selectedName=p1.text

        userpopup.open()
}
}
}
Rectangle{
    id:rect2
    x:20
    y:100
    width:80
    height: 18
    color: "transparent"
  border.width: 1
  border.color: "skyblue"
Text
{
    id:p2
    text:""
    anchors.centerIn: parent

}
MouseArea{
    anchors.fill: parent
    onClicked:
    {

        rect2.color="green"
        rect1.color="transparent"

        rect3.color="transparent"
        rect4.color="transparent"
        rect5.color="transparent"
        settingsroot.selectedName=p2.text

        userpopup.open()
}
}
}
Rectangle{
    id:rect3
    x:20
    y:130
    width:80
    height: 18
    color: "transparent"
  border.width: 1
  border.color: "skyblue"
Text
{
    id:p3
    text:""
    anchors.centerIn: parent

}
MouseArea{
    anchors.fill: parent
    onClicked:
    {
        rect3.color="green"
        rect1.color="transparent"

        rect2.color="transparent"
        rect4.color="transparent"
        rect5.color="transparent"
        settingsroot.selectedName=p3.text

        userpopup.open()
    }
}
}
Rectangle{
    id:rect4
    x:20
    y:160
    width:80
    height: 18
    color: "transparent"
  border.width: 1
  border.color: "skyblue"
Text
{
    id:p4
    text:""
    anchors.centerIn: parent

}
MouseArea{
    anchors.fill: parent
    onClicked:
    {

        rect4.color="green"
        rect1.color="transparent"

        rect2.color="transparent"
        rect3.color="transparent"
        rect5.color="transparent"
        settingsroot.selectedName=p4.text

        userpopup.open()
    }
}
}
Rectangle{
    id:rect5
    x:20
    y:190
    width:80
    height: 18
    color: "transparent"
  border.width: 1
  border.color: "skyblue"
Text
{
    id:p5
    text:""
    anchors.centerIn: parent

}
MouseArea{
    anchors.fill: parent
    onClicked:
    {

        rect5.color="green"
        rect1.color="transparent"

        rect2.color="transparent"
        rect4.color="transparent"
        rect3.color="transparent"
        settingsroot.selectedName=p5.text
        userpopup.open()

}
}
}


Label
{
    text: "USERS"
    font.bold: true
    font.pointSize: 20
 x:50
 y:20

}


}
    /*---------------------------------------------------------------------------------UserDeclinepopup--------------------------------------------------*/


    Popup
    {
   id:decline
   x: 100
   y: 200
   width: 200
   height: 80
   modal: true
   focus: true
   closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
   background: Rectangle {

       opacity: 3
       border.color: "black"
       border.width: 1
       radius: 2
       color: "white"
   }

   Text {

      id:declineText

        clip: true
        anchors.centerIn: parent
        color: "red"
       text:"Sorry! User List Full"
  font.pointSize: 13

  }
   Button{
       id:declineButton
       text: "ok"
       anchors.top: declineText.bottom
        background: Rectangle {
           implicitWidth: 40
           implicitHeight: 20
           opacity: 0.5
           border.color: "black"
           border.width: 1
           radius: 2
           color: "red"
       }
        onClicked:
        {
            popup.close()
         decline.close()
        }

}
    }
    /*-------------------------------------------------------userpopup----------------------------------------------------------------------*/


    Popup
    {
   id:userpopup
   x: 80
   y: 200
   width: 220
   height: 100
   modal: true
   focus: true
   closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
   background: Rectangle {

       opacity: 3
       border.color: "black"
       border.width: 1
       radius: 2
       color: "white"
   }
 Button
 {
 id:change
 text: "Change"
 x:20
 y:20
 onClicked:
 {
     var data1=[]
      data1=database.accessRow(settingsroot.selectedName)
t1.text=data1[1]
t2.text=data1[2]
     t3.text=data1[3]
  changepopup.open()

        }
 }
 Button{
 id:view1
 text: "view"
 x:120
 y:20
  onClicked: {
      var data=[]
       data=database.accessRow(settingsroot.selectedName)





       testing.fromCarSettings(data[0],data[1],data[2],data[3])
   userpopup.close()
    viewpopup.close()
  }


 }


    }
 /*--------------------------------------------------changepopup----------------------------------------------------_*/
    Popup
    {
   id:changepopup
   x: 100
   y: 100
   width: 300
   height: 200
   modal: true
   focus: true
   closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
   background: Rectangle {

       opacity: 0.8
       border.color: "black"
       border.width: 1
       radius: 2
       color: "white"
   }
   Label{
       text: "Needle  :"
       x:20
       y:20
   }
   Label{
       text: "BackGround  :"
       x:20
       y:60
   }
   Label{
       text: "Font Color :"
       x:20
       y:100
   }


   ComboBox {
       id: combo1

       clip: true
 x:140
 y:20
       model:['','green','blue','red','brown','teal']
     Text
     {
         id:t1
         text: ""
         opacity: 5
         font.bold: true

     }


     onCurrentTextChanged:  {
         t1.text=" "

     }

   }

   ComboBox {
       id: combo2
       clip: true
       x:140
       y:60
       model:['','gray','lavender','teal','silver','olive']
     Text
     {
         id:t2
         text: ""
         opacity: 5
         font.bold: true


     }


     onCurrentTextChanged:  {
         t2.text=" "

     }

   }

   ComboBox {
       id: combo3

       clip: true
       x:140
       y:100
       model:['','green','blue','red','grey','lavender']
     Text
     {
         id:t3
         text: ""
         font.bold: true
         opacity: 5

     }
     onCurrentTextChanged:  {
         t3.text=" "

     }


   }


   Button{
       id:save
       text: "Save"
       x:80
       y:150
       background: Rectangle {
           implicitWidth: 80
           implicitHeight: 40
           opacity: 0.8
           border.color: "black"
           border.width: 1
           radius: 2
           color: "red"
       }
        onClicked:{
           console.log(settingsroot.selectedName)
            database.getSettings(settingsroot.selectedName,combo1.currentText,combo2.currentText,combo3.currentText)

         changepopup.close()
userpopup.close()
         }

}
}
}

