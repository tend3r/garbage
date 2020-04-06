import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Item {
    id: rgstrForm
    width: parent.width
    height: parent.height

    Text {
        id: sign
        text: qsTr("Sign Up")
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
        echoMode: TextInput.Password
    }

    TextField {
        id: repeatPassword
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: password.bottom
        anchors.topMargin: 5
        placeholderText: "Repeat password..."
        echoMode: TextInput.Password

    }

    TextField {
        id: nickname
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: repeatPassword.bottom
        anchors.topMargin: 5
        placeholderText: "Nickname..."

    }

    Button  {
        id: button
        anchors.top: (status == 0) ? password.bottom : nickname.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        text: (status == 0) ? "Sign In" : "Sign Up"
        enabled: login.length > 4 && password.length > 4 &&
                         repeatPassword.length > 4 && nickname.length > 4
        onClicked: {
                   if (password.text != repeatPassword.text)
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
        }

}
