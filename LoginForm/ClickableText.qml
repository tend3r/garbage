import QtQuick 2.0

Text {
    id: clickableText
    color: "grey"
    text: qsTr("")
    font.pixelSize: 12

    signal clicked

    MouseArea {
        id: mouseSignUp
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            clickableText.clicked()
        }
    }
}
