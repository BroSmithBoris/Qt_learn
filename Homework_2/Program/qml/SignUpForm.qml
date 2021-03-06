import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Item {
    id: signUp
    width: parent.width
    height: parent.height
    anchors.horizontalCenter: parent.horizontalCenter

    Text {
        id: signUpTitleText
        text: "SIGN UP"
        font.pixelSize: 25
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        color: "#404040"
    }

    TextField {
        id: signUpLogin
        width: signUp.width - 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpTitleText.bottom
        anchors.topMargin: 10
        placeholderText: "login"
        font.pixelSize: 18
    }

    TextField {
        id: signUpPassword
        width: signUp.width - 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpLogin.bottom
        anchors.topMargin: 10
        placeholderText: "password"
        echoMode: TextInput.Password
        font.pixelSize: 18
    }

    TextField {
        id: signUpRepeatPassword
        width: signUp.width - 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpPassword.bottom
        anchors.topMargin: 10
        placeholderText: "repeat password"
        echoMode: TextInput.Password
        font.pixelSize: 18
    }

    TextField {
        id: signUpNickname
        width: signUp.width - 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signUpRepeatPassword.bottom
        anchors.topMargin: 10
        placeholderText: "nickname"
        font.pixelSize: 18
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
