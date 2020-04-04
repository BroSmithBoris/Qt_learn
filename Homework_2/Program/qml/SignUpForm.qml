import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Item {
    width: parent.width
    height: parent.height
    id: signUp
    anchors.horizontalCenter: parent.horizontalCenter

    Text {
        id: signUpTitleText
        text: "SIGN UP"
        font.pixelSize: titleTextSize
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        color: titleTextColor
    }

    TextField {
        id: signUpLogin
        width: signUp.width - marginIndent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpTitleText.bottom
        anchors.topMargin: 10
        placeholderText: "login"
        font.pixelSize: textFieldSize
    }

    TextField {
        id: signUpPassword
        width: signUp.width - marginIndent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpLogin.bottom
        anchors.topMargin: 10
        placeholderText: "password"
        echoMode: TextInput.Password
        font.pixelSize: textFieldSize
    }

    TextField {
        id: signUpRepeatPassword
        width: signUp.width - marginIndent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpPassword.bottom
        anchors.topMargin: 10
        placeholderText: "repeat password"
        echoMode: "Password"
        font.pixelSize: textFieldSize
    }

    TextField {
        id: signUpNickname
        width: signUp.width - marginIndent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpRepeatPassword.bottom
        anchors.topMargin: 10
        placeholderText: "nickname"
        font.pixelSize: textFieldSize
    }

    Button {
        id: signUpLoginButton
        text: "Sign up"
        enabled: signUpPassword.length > 5 && signUpLogin.length > 5 && signUpRepeatPassword.length > 5 && signUpNickname.length > 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top: signUpNickname.bottom
        onClicked: passwordDontMatch.visible = true
    }

    Text {
        id: passwordDontMatch
        text: "Password value aren't same!"
        color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpLoginButton.bottom
        anchors.topMargin: 20
        font.pixelSize: 20
        visible: false
    }
}
