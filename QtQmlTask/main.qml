import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.0
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TextField {
        id: textFieldwPath;
        width: parent.width - fileChooseButton.width - 15;
        anchors.leftMargin: 5;
        anchors.left: parent.left;
        placeholderText : qsTr("...");
        placeholderTextColor : "grey";
        anchors.verticalCenter: parent.verticalCenter;
    }

    Button {
      id: fileChooseButton
      text: "Выбрать"
      anchors.verticalCenter: parent.verticalCenter;
      anchors.right: parent.right;
      anchors.rightMargin: 5;
      onClicked: {
        fileDialog.visible = true;
      }

    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        nameFilters: [ "Image files (*.png)"]
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls);
            textFieldwPath.placeholderText = qsTr(fileDialog.fileUrl.toString());
            textFieldwPath.placeholderTextColor = "black";

        }

        onRejected: {
            console.log("Canceled")
        }
    }



}
