import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 280
    height: 500
    title: qsTr("Authorization")
    color: "white"
    flags: Qt.Dialog |  Qt.CustomizeWindowHint | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowSystemMenuHint
    property int marginIndent: 30
    property int titleTextSize: 25
    property int textFieldSize: 18
    property int bottomButtonSize: 17
    property string titleTextColor: "#454545"
    property string bottomButtonColor: "#454545"

    Item {
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
            width: signIn.parent.width - marginIndent
            anchors.top: signInTitleText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            placeholderText: "login..."
            font.pixelSize: textFieldSize
        }

        TextField {
            id: signInPassword
            width: signIn.parent.width - marginIndent
            anchors.top: signInLogin.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            placeholderText: "password..."
            echoMode: "Password"
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

    Item {
        id: signUp
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false

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
            width: signUp.parent.width - marginIndent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: signUpTitleText.bottom
            anchors.topMargin: 10
            placeholderText: "login"
            font.pixelSize: textFieldSize
        }

        TextField {
            id: signUpPassword
            width: signUp.parent.width - marginIndent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: signUpLogin.bottom
            anchors.topMargin: 10
            placeholderText: "password"
            echoMode: "Password"
            font.pixelSize: textFieldSize
        }

        TextField {
            id: signUpRepeatPassword
            width: signUp.parent.width - marginIndent
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: signUpPassword.bottom
            anchors.topMargin: 10
            placeholderText: "repeat password"
            echoMode: "Password"
            font.pixelSize: textFieldSize
        }

        TextField {
            id: signUpNickname
            width: signUp.parent.width - marginIndent
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

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        spacing: 10

        Text {
            id: signInButton
            text: "Sign in"
            font.pixelSize: bottomButtonSize
            anchors.bottom: parent.bottom
            font.underline: true
            color: bottomButtonColor

            MouseArea {
                id: signInMouseArea
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if(!signIn.visible) {
                        signUp.visible = false
                        signUpButton.font.underline = false
                        signInButton.font.underline = true
                        signIn.visible = true
                    }
                }
            }
        }

        Text {
            id: slash
            text: "/"
            font.pixelSize: bottomButtonSize
            anchors.bottom: parent.bottom
            color: bottomButtonColor

        }

        Text {
            id: signUpButton
            text: "Sign up"
            font.pixelSize: bottomButtonSize
            anchors.bottom: parent.bottom
            color: bottomButtonColor

            MouseArea{
                id: signUpMouseArea
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if(!signUp.visible) {
                        signIn.visible = false
                        signInButton.font.underline = false
                        signUpButton.font.underline = true
                        signUp.visible = true
                    }
                }
            }
        }
    }
}
