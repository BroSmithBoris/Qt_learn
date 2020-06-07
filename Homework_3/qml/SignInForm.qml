import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12
import AuthManager 1.0

Item {
    id: signIn
    width: parent.width
    height: parent.height
    anchors.horizontalCenter: parent.horizontalCenter

    AuthManager{
        id: authManager
        onAuthenticateRequestCompleted: {
            console.log("Authenticate finished!");
            console.log(token);
            completedWindow.setInformativeText("Авторизация прошла успешно!");
            completedWindow.open();
        }
        onAuthenticateRequestError: {
            console.log("Authenticate failed!");
            console.log(error);
            errorWindow.setInformativeText(error);
            errorWindow.open();
        }
    }

    Text {
        id: signInTitleText
        text: "SIGN IN"
        font.pixelSize: 25
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 10
        color: "#404040"
    }

    TextField {
        id: signInLogin
        width: signIn.width - 30
        anchors.top: signInTitleText.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        placeholderText: "login..."
        font.pixelSize: 18
    }

    TextField {
        id: signInPassword
        width: signIn.width - 30
        anchors.top: signInLogin.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        placeholderText: "password..."
        echoMode: TextInput.Password
        font.pixelSize: 18
    }

    Button {
        id: signInLoginButton
        text: "Sign in"
        enabled: signInPassword.length >= 5 && signInLogin.length >= 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        anchors.top: signInPassword.bottom
        onClicked: {
            loadingCycle.visible = true
            authManager.authenticate(signInLogin.text, signInPassword.text)
        }

    }

    BusyIndicator{
        id: loadingCycle
        visible: false
        running: authManager.isAuthenticateProcessing
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: signInLoginButton.bottom
        anchors.topMargin: 10
    }
}
