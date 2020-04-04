import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Item {
    width: parent.width
    height: parent.height
    id: signIn
    anchors.horizontalCenter: parent.horizontalCenter

    Text {
        id: signInTitleText
        text: "SIGN IN"
        font.pixelSize: titleTextSize
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        color: titleTextColor
    }

    TextField {
        id: signInLogin
        width: signIn.width - marginIndent
        anchors.top: signInTitleText.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        placeholderText: "login..."
        font.pixelSize: textFieldSize
    }

    TextField {
        id: signInPassword
        width: signIn.width - marginIndent
        anchors.top: signInLogin.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        placeholderText: "password..."
        echoMode: TextInput.Password
        font.pixelSize: textFieldSize
    }

    Button {
        id: signInLoginButton
        text: "Sign in"
        enabled: signInPassword.length > 5 && signInLogin.length > 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top: signInPassword.bottom
        onClicked: loadingCycle.visible = true
    }

    BusyIndicator{
        id: loadingCycle
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signInLoginButton.bottom
        anchors.topMargin: 10
    }
}
