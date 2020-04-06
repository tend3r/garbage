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

    Loader{
        id: mainLoader
        anchors.fill: parent
        anchors.bottomMargin: 40
        source: (window.status == 0) ? "qrc:/LoginForm.qml" : "qrc:/RegistrationForm.qml"
    }

    Row {
        id: bottomRow
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5
        bottomPadding: 5

        ClickableText {
            id: signInButton
            text: qsTr("Sign In")
            font.underline: status == 0
            onClicked:
            {
                window.status = 0
                login.text = ""
                password.text = ""
                repeatPassword.text = ""
                nickname.text = ""
                passwordValue.visible = false
                loadingIndicator.visible = false
            }
        }

        Text {
            id: slash
            color: "grey"
            text: qsTr("/")
            font.pixelSize: 12
        }

        ClickableText {
            id: signUpButton
            text: qsTr("Sign Up")
            font.underline: status == 1
            onClicked:
            {
                window.status = 1
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
