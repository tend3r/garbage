import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    width: 280
    height: 500
    title: qsTr("Sign Form")
    color: "white"
    property int status: 0

    Text {
        id: sign
        text: qsTr("Sign In")
        font.pixelSize: 27
        color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 48
    }

    TextField {
        id: login
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: sign.bottom
        anchors.topMargin: 5
        placeholderText: "Login..."
    }

    TextField {
        id: password
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: login.bottom
        anchors.topMargin: 5
        placeholderText: "Password..."
    }

    TextField {
        id: repeatPassword
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: password.bottom
        anchors.topMargin: 5
        visible: (status == 1) ? true : false
        placeholderText: "Repeat password..."

    }

    TextField {
        id: nickname
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: repeatPassword.bottom
        anchors.topMargin: 5
        visible: (status == 1) ? true : false
        placeholderText: "Nickname..."

    }

    Button  {
        id: button
        anchors.top: (status == 0) ? password.bottom : nickname.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        text: (status == 0) ? "Sign In" : "Sign Up"
        enabled: status == 0 && login.length > 4 && password.length > 4 ||
                         status == 1 && login.length > 4 && password.length > 4 &&
                         repeatPassword.length > 4 && nickname.length > 4
        onClicked: {
                   if (status == 1 && password.text != repeatPassword.text)
                   {
                       passwordValue.visible = true
                   }
                   else
                       loadingIndicator.visible = true
               }
    }

    Text{
        id: passwordValue
        text: "Password values aren't same!"
        font.pixelSize: 14
        color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: button.bottom
        anchors.topMargin: 10
        visible: false
    }

    BusyIndicator {
            id: loadingIndicator
            anchors.top: button.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            width: 50; height: 50
            running: true
            opacity: 1
            visible: false
            OpacityAnimator{
                id: loadingIndicatorOpacity
                target: loadingIndicator
                from: 0;
                to: 1;
                duration: 1000
                running: false
            }
        }

    Row {
        id: bottomRow
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5
        bottomPadding: 5

        Text {
            id: signinbuttin
            text: qsTr("Sign In")
            color: "grey"
            font.pixelSize: 12
            font.underline: (status == 0) ? true : false
            MouseArea {
                           id: mouseSignIn
                           enabled: !instance
                           anchors.fill: parent
                           cursorShape: Qt.PointingHandCursor
                           onClicked: {
                               window.status = 0
                               sign.text = "Sign In"
                               login.text = ""
                               password.text = ""
                               repeatPassword.text = ""
                               nickname.text = ""
                               passwordValues.visible = false
                               loadingIndicator.visible = false
                           }
                       }
        }

        Text {
            id: slash
            color: "grey"
            text: qsTr("/")
            font.pixelSize: 12
        }

        Text {
            id: signupbutton
            color: "grey"
            text: qsTr("Sign Up")
            font.pixelSize: 12
            font.underline: (status == 1) ? true : false
            MouseArea {
                           id: mouseSignUp
                           enabled: !instance
                           anchors.fill: parent
                           cursorShape: Qt.PointingHandCursor
                           onClicked: {
                               window.status = 1
                               sign.text = "Sign Up"
                               login.text = ""
                               password.text = ""
                               repeatPassword.text = ""
                               nickname.text = ""
                               passwordValue.visible = false
                               loadingIndicator.visible = false
                           }
                       }
        }

    }

}
