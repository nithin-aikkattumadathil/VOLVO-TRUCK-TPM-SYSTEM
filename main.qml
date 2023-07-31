import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Controls 2.0
import QtQuick.Dialogs
Window {
    id: window
    width: 1250
    height: 640
    color: "white"
    visible: true
    property double needleangle: 0
    property double fromspeedvalue: 0
    property double tospeedvalue: 0
    property int rotationangle: 0
    property int currentValue: 1
    property int targetValue: 139
    property int targetValuee: 69
    property int targetValueee: 49
    property int animationDuration: 500

    FontLoader { id: rajdhaniSmBold; source: "Fonts/Rajdhani-SemiBold.ttf" }
    title: qsTr("TPM_VOLVO")

    Rectangle{
        width: 1250
        height: 640
        color: "BLACK"
        //-----------------------------------------------------------background-----------------------------------------------------------
        Image {
            id: backshade
            source: "back2.jpg"
            anchors.centerIn: parent
            width: 1250
            height:632
        }
        Image {
            id: pixel_logo
            source: "PixelExpert_Logo_trim.png"

            y:560
            x:425
            width: 130
            height:50
        }
        Image {
            id: volvotruck
            source: "volvo_half.png"
            y:0
            x:950
            width: 300
            height:632
        }
        Image {
            id: volvotop
            source: "firefly2.png"
            y:55
            x:270
            width: 450
            height:520
        }
        Image {
            id:logo
            source: "logo.png"
            y:0
            x:0
            width: 200
            height:100
        }
        Text {
            id: titlex
            x: 5
            y:615
            width: 221
            height: 61
            color: "white"
            text: "NOTE: Please check manually for additional safety"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: tpms
            x: 450
            y: 0
            width:300
            height: 61
            color: "sky blue"
            text: "Volvo Electric - Tyre Pressure Monitoring System"
            font {
                family: "rajdhaniSmBold"
                pixelSize:40
            }
            horizontalAlignment: Text.AlignHCenter
        }
        //---------------------------------------------------------compass----------------------------------------------------------------
        Image {
            id: compass
            width: 120
            height: 120
            x: 50
            y: 100
            source: "compass2.png"
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: {
                    buttonContainer.visible = true
                }
            }

            Item {
                id: buttonContainer
                visible: false
                width: parent.width
                height: parent.height

                Button {
                    id: leftButton
                    text: "UP"
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.width / 2 - 80
                    onClicked: {
                        seqanimation.start()
                        // Handle left button click
                        console.log("UP button clicked")
                    }
                }

                Button {
                    id: rightButton
                    text: "DOWN"
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.width / 2 + 60
                    onClicked: {
                        seqanimation2.start()
                        console.log("DOWN button clicked")
                    }
                }
            }

        }
        //----------------------------------------------------------------psi-1-----------------------------------------------------------
        Image{
            id:compassneedle
            width: 120
            height: 120
            x: compass.x + (compass.width - width) / 2
            y: compass.y + (compass.height - height) / 2
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"

            SequentialAnimation {
                id:seqanimation
                running: true
                NumberAnimation {
                    target:compassneedle
                    property: "rotation"
                    from: -160
                    to:200
                    easing.type:Easing.InOutBounce
                    duration: 5000
                }

            }
            SequentialAnimation {
                id:seqanimation2
                running: true
                NumberAnimation {
                    target:compassneedle
                    property: "rotation"
                    from: 200
                    to:-160
                    easing.type:Easing.OutCurve
                    duration: 5000
                }

            }
        }
        Image{
            id:compasscentre
            width: 100
            height: 100
            x: compass.x + (compass.width - width) / 2
            y: compass.y + (compass.height - height) / 2
            source: "Speedo_Gauge_Center_Circle.png"

        }

        Image{
            id:speedo_guage_bg
            width: 150
            height: 150
            x:235
            y:71
            source: "Speedo_Gauge_BG.png"
            //            MouseArea {
            //                anchors.fill: parent
            //                onPressed: {
            //                    // Show a pop-up message when the image is pressed
            //                    messageDialog.open()
            //                }
            //            }
        }

        //        MessageDialog{
        //            id: messageDialog
        //            title: "Tyre 1 Details"
        //            text: "              Tyre Pressuere: 70 psi
        //            Temperature : 30degree
        //            Tyre condition: Normal"

        //        }

        Image{
            id:speedo_guage_needle
            width: 150
            height: 150
            x:235
            y:71
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim
                running: true
                NumberAnimation {
                    target:speedo_guage_needle
                    property: "rotation"
                    from: -135
                    to:22
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }

        }
        Image{
            id:speedo_guage_centercircle
            width: 150
            height: 150
            x:235
            y:71
            source: "Speedo_Gauge_Center_Circle.png"
            MouseArea {
                id: mouseAreadecrease
                anchors.fill: parent
                onClicked: {
                    redcircle.visible = true
                    redanim.start()
                    title.visible = false
                    titledecrease.visible = true
                }
                onDoubleClicked: {
                    redcircle.visible = false
                    redanim2.start()
                    title.visible = true
                    titledecrease.visible = false
                }
            }
            Image {
                id: redcircle
                source: "redcircle.png"
                visible: false
                y: parent.width / 2 -85
                x: parent.width/2 -85
                width: speedo_guage_outercircle1.width
                height: speedo_guage_outercircle1.height
            }
            SequentialAnimation {
                id:redanim
                running: true
                NumberAnimation {
                    target:speedo_guage_needle
                    property: "rotation"
                    from: 22
                    to:-20
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }
            SequentialAnimation {
                id:redanim2
                running: true
                NumberAnimation {
                    target:speedo_guage_needle
                    property: "rotation"
                    from: -20
                    to:22
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }

            Text {
                id: titledecrease
                y: parent.width / 2 -16
                x: parent.width/2 -113
                width: 221
                height: 61
                visible: false
                color: "white"
                text: currentValue > targetValueee ? "50" : currentValue.toString()
                font {
                    family: "rajdhaniSmBold"
                    pixelSize: 20
                }
                horizontalAlignment: Text.AlignHCenter
            }
        }
        Timer {
            id: timer
            interval: animationDuration / (targetValuee - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValuee) {
                    timer.stop()
                    title.text = "70" // Update the text to "70" after the timer completes
                }
            }
        }

        Text {
            id: title
            x: 200
            y: 130
            width: 221
            height: 61
            color: "white"
            visible: true
            text: currentValue > targetValuee ? "70" : currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: title2
            x: 200
            y: 155
            width: 221
            height: 61
            color: "white"
            text: "PSI-1"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }


        Image{
            id:speedo_guage_outercircle1
            width: 170
            height: 172
            x:226
            y:61
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle2
            width: 150
            height: 150
            x:235
            y:71
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division
            width: 150
            height: 150
            x:235
            y:71
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers
            width: 150
            height: 150
            x:235
            y:71
            source: "Speedo_Gauge_Numbers.png"
        }


        //----------------------------------------------------------------psi-2-----------------------------------------------------------
        Image {
            id: speedo_guage_bg2
            width: 150
            height: 150
            x: 585
            y: 71
            source: "Speedo_Gauge_BG.png"
        }
        Image{
            id:speedo_guage_needle2
            width: 150
            height: 150
            x:585
            y:71
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim2
                running: true
                NumberAnimation {
                    target:speedo_guage_needle2
                    property: "rotation"
                    from: -135
                    to:22
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }
            NumberAnimation {
                id: speedomoveanim2
                target:speedo_guage_needle2
                property: "rotation"
                from: fromspeedvalue
                to:tospeedvalue
                easing.type:Easing.OutCirc
                duration: 5000
            }


        }
        Image{
            id:speedo_guage_centercircle2
            width: 150
            height: 150
            x:585
            y:71
            source: "Speedo_Gauge_Center_Circle.png"
            MouseArea {
                id: mouseAreadecrease2
                anchors.fill: parent
                onClicked: {
                    redcircle2.visible = true
                    redanim3.start()
                    title3.visible = false
                    titledecrease2.visible = true
                }
                onDoubleClicked: {
                    redcircle2.visible = false
                    redanim4.start()
                    title3.visible = true
                    titledecrease2.visible = false
                }
            }
            Image {
                id: redcircle2
                source: "redcircle.png"
                visible: false
                y: parent.width / 2 -85
                x: parent.width/2 -85
                width: speedo_guage_outercircle1.width
                height: speedo_guage_outercircle1.height
            }
            SequentialAnimation {
                id:redanim3
                running: true
                NumberAnimation {
                    target:speedo_guage_needle2
                    property: "rotation"
                    from: 22
                    to:-20
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }
            SequentialAnimation {
                id:redanim4
                running: true
                NumberAnimation {
                    target:speedo_guage_needle2
                    property: "rotation"
                    from: -20
                    to:22
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }

            Text {
                id: titledecrease2
                y: parent.width / 2 -16
                x: parent.width/2 -113
                width: 221
                height: 61
                visible: false
                color: "white"
                text: currentValue > targetValueee ? "50" : currentValue.toString()
                font {
                    family: "rajdhaniSmBold"
                    pixelSize: 20
                }
                horizontalAlignment: Text.AlignHCenter
            }
        }
        Timer {
            id: timer2
            interval: animationDuration / (targetValuee - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValuee) {
                    timer2.stop()
                    title3.text = "70" // Update the text to "70" after the timer completes
                }
            }
        }

        Text {
            id: title3
            x: 550
            y: 130
            width: 221
            height: 61
            color: "white"
            text: currentValue > targetValuee ? "70" : currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: title4
            x: 550
            y: 155
            width: 221
            height: 61
            color: "white"
            text: "PSI-2"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Image{
            id:speedo_guage_outercircle12
            width: 170
            height: 172
            x:576
            y:61
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle22
            width: 150
            height: 150
            x:585
            y:71
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division2
            width: 150
            height: 150
            x:585
            y:71
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers2
            width: 150
            height: 150
            x:585
            y:71
            source: "Speedo_Gauge_Numbers.png"
        }
        //--------------------------------------------------------------------------------------------------------------------------------
        Image{
            id:speedo_guage_bg3
            width: 150
            height: 150
            x:585
            y:251
            source: "Speedo_Gauge_BG.png"
        }

        Image{
            id:speedo_guage_needle3
            width: 150
            height: 150
            x:585
            y:251
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim3
                running: true
                NumberAnimation {
                    target:speedo_guage_needle3
                    property: "rotation"
                    from: -135
                    to:44
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }
            NumberAnimation {
                id: speedomoveanim3
                target:speedo_guage_needle3
                property: "rotation"
                from: fromspeedvalue
                to:tospeedvalue
                easing.type:Easing.OutCirc
                duration: 5000
            }


        }
        Image{
            id:speedo_guage_centercircle3
            width: 150
            height: 150
            x:585
            y:251
            source: "Speedo_Gauge_Center_Circle.png"
            MouseArea {
                id: mouseAreadecrease3
                anchors.fill: parent
                onClicked: {
                    redcircle3.visible = true
                    redanim5.start()
                    title5.visible = false
                    titledecrease3.visible = true
                }
                onDoubleClicked: {
                    redcircle3.visible = false
                    redanim6.start()
                    title5.visible = true
                    titledecrease3.visible = false
                }
            }
            Image {
                id: redcircle3
                source: "redcircle.png"
                visible: false
                y: parent.width / 2 -85
                x: parent.width/2 -85
                width: speedo_guage_outercircle1.width
                height: speedo_guage_outercircle1.height
            }
            SequentialAnimation {
                id:redanim5
                running: true
                NumberAnimation {
                    target:speedo_guage_needle3
                    property: "rotation"
                    from: 22
                    to:-20
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }
            SequentialAnimation {
                id:redanim6
                running: true
                NumberAnimation {
                    target:speedo_guage_needle3
                    property: "rotation"
                    from: -20
                    to:22
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }

            Text {
                id: titledecrease3
                y: parent.width / 2 -16
                x: parent.width/2 -113
                width: 221
                height: 61
                visible: false
                color: "white"
                text: currentValue > targetValueee ? "50" : currentValue.toString()
                font {
                    family: "rajdhaniSmBold"
                    pixelSize: 20
                }
                horizontalAlignment: Text.AlignHCenter
            }
        }
        Timer {
            id: timer4
            interval: animationDuration / (targetValuee - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValuee) {
                    timer4.stop()
                    title5.text = "80" // Update the text to "80" after the timer completes
                }
            }
        }

        Text {
            id: title5
            x: 550
            y: 310
            width: 221
            height: 61
            color: "white"
            text: currentValue > targetValuee ? "80" : currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: title6
            x: 550
            y: 335
            width: 221
            height: 61
            color: "white"
            text: "PSI-3"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Image{
            id:speedo_guage_outercircle13
            width: 170
            height: 172
            x:576
            y:241
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle23
            width: 150
            height: 150
            x:585
            y:251
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division3
            width: 150
            height: 150
            x:585
            y:250
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers3
            width: 150
            height: 150
            x:585
            y:251
            source: "Speedo_Gauge_Numbers.png"
        }
        //-------------------------------------------------------------------------------------------------------------------------------
        Image{
            id:speedo_guage_bg4
            width: 150
            height: 150
            x:785
            y:251
            source: "Speedo_Gauge_BG.png"
        }

        Image{
            id:speedo_guage_needle4
            width: 150
            height: 150
            x:785
            y:251
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim4
                running: true
                NumberAnimation {
                    target:speedo_guage_needle4
                    property: "rotation"
                    from: -135
                    to:44
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }
            NumberAnimation {
                id: speedomoveanim4
                target:speedo_guage_needle4
                property: "rotation"
                from: fromspeedvalue
                to:tospeedvalue
                easing.type:Easing.OutCirc
                duration: 5000
            }


        }
        Image{
            id:speedo_guage_centercircle4
            width: 150
            height: 150
            x:785
            y:251
            source: "Speedo_Gauge_Center_Circle.png"
            MouseArea {
                id: mouseAreadecrease4
                anchors.fill: parent
                onClicked: {
                    redcircle4.visible = true
                    redanim7.start()
                    title7.visible = false
                    titledecrease4.visible = true
                }
                onDoubleClicked: {
                    redcircle4.visible = false
                    redanim8.start()
                    title7.visible = true
                    titledecrease4.visible = false
                }
            }
            Image {
                id: redcircle4
                source: "redcircle.png"
                visible: false
                y: parent.width / 2 -85
                x: parent.width/2 -85
                width: speedo_guage_outercircle1.width
                height: speedo_guage_outercircle1.height
            }
            SequentialAnimation {
                id:redanim7
                running: true
                NumberAnimation {
                    target:speedo_guage_needle4
                    property: "rotation"
                    from: 22
                    to:-20
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }
            SequentialAnimation {
                id:redanim8
                running: true
                NumberAnimation {
                    target:speedo_guage_needle4
                    property: "rotation"
                    from: -20
                    to:22
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }

            Text {
                id: titledecrease4
                y: parent.width / 2 -16
                x: parent.width/2 -113
                width: 221
                height: 61
                visible: false
                color: "white"
                text: currentValue > targetValueee ? "50" : currentValue.toString()
                font {
                    family: "rajdhaniSmBold"
                    pixelSize: 20
                }
                horizontalAlignment: Text.AlignHCenter
            }
        }
        Timer {
            id: timer5
            interval: animationDuration / (targetValuee - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValuee) {
                    timer5.stop()
                    title7.text = "80" // Update the text to "70" after the timer completes
                }
            }
        }

        Text {
            id: title7
            x: 750
            y: 310
            width: 221
            height: 61
            color: "white"
            text: currentValue > targetValuee ? "80" : currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: title8
            x:750
            y: 335
            width: 221
            height: 61
            color: "white"
            text: "PSI-4"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Image{
            id:speedo_guage_outercircle14
            width: 170
            height: 172
            x:776
            y:241
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle24
            width: 150
            height: 150
            x:785
            y:251
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division4
            width: 150
            height: 150
            x:785
            y:250
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers4
            width: 150
            height: 150
            x:785
            y:251
            source: "Speedo_Gauge_Numbers.png"
        }
        //--------------------------------------------------------------------------------------------------------------------------
        Image{
            id:speedo_guage_bg5
            width: 150
            height: 150
            x:235
            y:251
            source: "Speedo_Gauge_BG.png"
        }

        Image{
            id:speedo_guage_needle5
            width: 150
            height: 150
            x:235
            y:251
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim5
                running: true
                NumberAnimation {
                    target:speedo_guage_needle5
                    property: "rotation"
                    from: -135
                    to:44
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }
            NumberAnimation {
                id: speedomoveanim5
                target:speedo_guage_needle5
                property: "rotation"
                from: fromspeedvalue
                to:tospeedvalue
                easing.type:Easing.OutCirc
                duration: 5000
            }


        }
        Image{
            id:speedo_guage_centercircle5
            width: 150
            height: 150
            x:235
            y:251
            source: "Speedo_Gauge_Center_Circle.png"
            MouseArea {
                id: mouseAreadecrease5
                anchors.fill: parent
                onClicked: {
                    redcircle5.visible = true
                    redanim9.start()
                    title9.visible = false
                    titledecrease5.visible = true
                }
                onDoubleClicked: {
                    redcircle5.visible = false
                    redanim10.start()
                    title9.visible = true
                    titledecrease5.visible = false
                }
            }
            Image {
                id: redcircle5
                source: "redcircle.png"
                visible: false
                y: parent.width / 2 -85
                x: parent.width/2 -85
                width: speedo_guage_outercircle1.width
                height: speedo_guage_outercircle1.height
            }
            SequentialAnimation {
                id:redanim9
                running: true
                NumberAnimation {
                    target:speedo_guage_needle5
                    property: "rotation"
                    from: 22
                    to:-20
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }
            SequentialAnimation {
                id:redanim10
                running: true
                NumberAnimation {
                    target:speedo_guage_needle5
                    property: "rotation"
                    from: -20
                    to:22
                    easing.type:Easing.OutExpo
                    duration: 5000
                }

            }

            Text {
                id: titledecrease5
                y: parent.width / 2 -16
                x: parent.width/2 -113
                width: 221
                height: 61
                visible: false
                color: "white"
                text: currentValue > targetValueee ? "50" : currentValue.toString()
                font {
                    family: "rajdhaniSmBold"
                    pixelSize: 20
                }
                horizontalAlignment: Text.AlignHCenter
            }
        }
        Timer {
            id: timer8
            interval: animationDuration / (targetValuee - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValuee) {
                    timer8.stop()
                    title9.text = "80" // Update the text to "70" after the timer completes
                }
            }
        }

        Text {
            id: title9
            x: 200
            y: 310
            width: 221
            height: 61
            color: "white"
            text: currentValue > targetValuee ? "80" : currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: title10
            x: 200
            y: 335
            width: 221
            height: 61
            color: "white"
            text: "PSI-5"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Image{
            id:speedo_guage_outercircle15
            width: 170
            height: 172
            x:226
            y:241
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle25
            width: 150
            height: 150
            x:235
            y:251
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division5
            width: 150
            height: 150
            x:235
            y:251
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers5
            width: 150
            height: 150
            x:235
            y:251
            source: "Speedo_Gauge_Numbers.png"
        }
        //---------------------------------------------------------------------------------------------------------------------------
        Image{
            id:speedo_guage_bg6
            width: 150
            height: 150
            x:235
            y:431
            source: "Speedo_Gauge_BG.png"
        }

        Image{
            id:speedo_guage_needle6
            width: 150
            height: 150
            x:235
            y:431
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim6
                running: true
                NumberAnimation {
                    target:speedo_guage_needle6
                    property: "rotation"
                    from: -135
                    to:180
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }
            NumberAnimation {
                id: speedomoveanim6
                target:speedo_guage_needle6
                property: "rotation"
                from: fromspeedvalue
                to:tospeedvalue
                easing.type:Easing.OutCirc
                duration: 5000
            }


        }
        Image{
            id:speedo_guage_centercircle6
            width: 150
            height: 150
            x:235
            y:431
            source: "Speedo_Gauge_Center_Circle.png"
        }
        Timer {
            id: timer6
            interval: animationDuration / (targetValue - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValue) {
                    timer6.stop()
                }
            }
        }

        Text {
            id: title11
            x: 200
            y: 490
            width: 221
            height: 61
            color: "white"
            text: currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: title12
            x: 200
            y:515
            width: 221
            height: 61
            color: "white"
            text: "PSI-6"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Image{
            id:speedo_guage_outercircle16
            width: 170
            height: 172
            x:226
            y:421
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle26
            width: 150
            height: 150
            x:235
            y:431
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division6
            width: 150
            height: 150
            x:235
            y:431
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers6
            width: 150
            height: 150
            x:235
            y:431
            source: "Speedo_Gauge_Numbers.png"
        }
        //---------------------------------------------------------------------------------------------------------------------------------
        Image{
            id:speedo_guage_bg7
            width: 150
            height: 150
            x:35
            y:431
            source: "Speedo_Gauge_BG.png"
        }

        Image{
            id:speedo_guage_needle7
            width: 150
            height: 150
            x:35
            y:431
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim7
                running: true
                NumberAnimation {
                    target:speedo_guage_needle7
                    property: "rotation"
                    from: -135
                    to:180
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }
            NumberAnimation {
                id: speedomoveanim7
                target:speedo_guage_needle6
                property: "rotation"
                from: fromspeedvalue
                to:tospeedvalue
                easing.type:Easing.OutCirc
                duration: 5000
            }


        }
        Image{
            id:speedo_guage_centercircle7
            width: 150
            height: 150
            x:35
            y:431
            source: "Speedo_Gauge_Center_Circle.png"
        }
        Timer {
            id: timer7
            interval: animationDuration / (targetValue - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValue) {
                    timer7.stop()
                }
            }
        }

        Text {
            id: title14
            x: 0
            y: 490
            width: 221
            height: 61
            color: "white"
            text: currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: title13
            x: 0
            y:515
            width: 221
            height: 61
            color: "white"
            text: "PSI-7"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Image{
            id:speedo_guage_outercircle17
            width: 170
            height: 172
            x:26
            y:421
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle27
            width: 150
            height: 150
            x:35
            y:431
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division7
            width: 150
            height: 150
            x:35
            y:431
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers7
            width: 150
            height: 150
            x:35
            y:431
            source: "Speedo_Gauge_Numbers.png"
        }
        //--------------------------------------------------------------------------------------------------------------------------------
        Image{
            id:speedo_guage_bg8
            width: 150
            height: 150
            x:35
            y:251
            source: "Speedo_Gauge_BG.png"
        }

        Image{
            id:speedo_guage_needle8
            width: 150
            height: 150
            x:35
            y:251
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim8
                running: true
                NumberAnimation {
                    target:speedo_guage_needle8
                    property: "rotation"
                    from: -135
                    to:44
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }
            NumberAnimation {
                id: speedomoveanim8
                target:speedo_guage_needle6
                property: "rotation"
                from: fromspeedvalue
                to:tospeedvalue
                easing.type:Easing.OutCirc
                duration: 5000
            }


        }
        Image{
            id:speedo_guage_centercircle8
            width: 150
            height: 150
            x:35
            y:251
            source: "Speedo_Gauge_Center_Circle.png"
        }
        Timer {
            id: timer9
            interval: animationDuration / (targetValuee - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValuee) {
                    timer9.stop()
                    title15.text = "80" // Update the text to "70" after the timer completes
                }
            }
        }

        Text {
            id: title15
            x: 00
            y: 310
            width: 221
            height: 61
            color: "white"
            text: currentValue > targetValuee ? "80" : currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: title16
            x: 00
            y: 335
            width: 221
            height: 61
            color: "white"
            text: "PSI-8"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Image{
            id:speedo_guage_outercircle18
            width: 170
            height: 172
            x:26
            y:241
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle28
            width: 150
            height: 150
            x:35
            y:251
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division8
            width: 150
            height: 150
            x:35
            y:251
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers8
            width: 150
            height: 150
            x:35
            y:251
            source: "Speedo_Gauge_Numbers.png"
        }
        //-----------------------------------------------------------------------------------------------------------------------
        Image{
            id:speedo_guage_bg9
            width: 150
            height: 150
            x:585
            y:431
            source: "Speedo_Gauge_BG.png"
        }

        Image{
            id:speedo_guage_needle9
            width: 150
            height: 150
            x:585
            y:431
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim9
                running: true
                NumberAnimation {
                    target:speedo_guage_needle9
                    property: "rotation"
                    from: -135
                    to:180
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }
            NumberAnimation {
                id: speedomoveanim9
                target:speedo_guage_needle9
                property: "rotation"
                from: fromspeedvalue
                to:tospeedvalue
                easing.type:Easing.OutCirc
                duration: 5000
            }


        }
        Image{
            id:speedo_guage_centercircle9
            width: 150
            height: 150
            x:585
            y:431
            source: "Speedo_Gauge_Center_Circle.png"
        }
        Timer {
            id: timer13
            interval: animationDuration / (targetValue - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValue) {
                    timer13.stop()
                }
            }
        }

        Text {
            id: title17
            x: 550
            y: 490
            width: 221
            height: 61
            color: "white"
            text: currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: title18
            x: 550
            y: 515
            width: 221
            height: 61
            color: "white"
            text: "PSI-9"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Image{
            id:speedo_guage_outercircle19
            width: 170
            height: 172
            x:576
            y:421
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle29
            width: 150
            height: 150
            x:585
            y:431
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division9
            width: 150
            height: 150
            x:585
            y:430
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers9
            width: 150
            height: 150
            x:585
            y:431
            source: "Speedo_Gauge_Numbers.png"
        }
        //--------------------------------------------------------------------------------------------------------------------------
        Image{
            id:speedo_guage_bg10
            width: 150
            height: 150
            x:785
            y:431
            source: "Speedo_Gauge_BG.png"
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    // Show a pop-up message when the image is pressed
                    messageDialog.open()
                }
            }
        }
        MessageDialog{
            id: messageDialog
            title: "Tyre 10 Details"
            text: "                   Tyre Pressuere: 70 psi
                    Temperature : 30degree
                    Tyre condition: Normal"

        }
        Image{
            id:speedo_guage_needle10
            width: 150
            height: 150
            x:785
            y:431
            rotation: 0;
            smooth: true
            source: "Speedo_Gauge_Needle.png"
            SequentialAnimation {
                id:seqanim10
                running: true
                NumberAnimation {
                    target:speedo_guage_needle10
                    property: "rotation"
                    from: -135
                    to:180
                    easing.type:Easing.OutCirc
                    duration: 5000
                }

            }
            NumberAnimation {
                id: speedomoveanim10
                target:speedo_guage_needle10
                property: "rotation"
                from: fromspeedvalue
                to:tospeedvalue
                easing.type:Easing.OutCirc
                duration: 5000
            }


        }
        Image{
            id:speedo_guage_centercircle10
            width: 150
            height: 150
            x:785
            y:431
            source: "Speedo_Gauge_Center_Circle.png"
        }
        Timer {
            id: timer10
            interval: animationDuration / (targetValue - currentValue + 1)
            running: true
            repeat: true
            onTriggered: {
                currentValue++
                if (currentValue > targetValue) {
                    timer10.stop()
                }
            }
        }

        Text {
            id: title19
            x:750
            y: 490
            width: 221
            height: 61
            color: "white"
            text: currentValue.toString()
            font {
                family: "rajdhaniSmBold"
                pixelSize: 20
            }
            horizontalAlignment: Text.AlignHCenter
        }
        Text {
            id: title20
            x:750
            y: 515
            width: 221
            height: 61
            color: "white"
            text: "PSI-10"
            font {
                family: "rajdhaniSmBold"
                pixelSize: 10
            }
            horizontalAlignment: Text.AlignHCenter
        }

        Image{
            id:speedo_guage_outercircle110
            width: 170
            height: 172
            x:776
            y:421
            source: "Speedo_Gauge_Outer_Circle1.png"
        }
        Image{
            id:speedo_guage_outercircle210
            width: 150
            height: 150
            x:785
            y:431
            source: "Speedo_Gauge_Outer_Circle2.png"
        }
        Image{
            id:speedo_guage_division10
            width: 150
            height: 150
            x:785
            y:430
            source: "Speedo_Gauge_Divisions.png"
        }
        Image{
            id:speedo_guage_numbers10
            width: 150
            height: 150
            x:785
            y:431
            source: "Speedo_Gauge_Numbers.png"
        }
    }
}
