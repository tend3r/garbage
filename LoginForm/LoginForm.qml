import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Item {
    id: loginForm
    width: parent.width
    height: parent.height

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
        echoMode: TextInput.Password
    }

    Button  {
        id: button
        anchors.top: password.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        text: "Sign In"
        enabled: login.length > 4 && password.length > 4

        onClicked: {
            loadingIndicator.visible = true
        }
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
