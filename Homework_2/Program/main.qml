import QtQuick 2.12
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
    property string titleTextColor: "#404040"
    property string bottomButtonColor: "#404040"
    property string currentForm: "sign_in"

    Loader {
        id: mainLoader
        anchors.fill: parent
        anchors.bottomMargin: 40
        source: (currentForm == "sign_in")
                ? "qrc:/qml/SignInForm.qml"
                : "qrc:/qml/SignUpForm.qml"
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        spacing: 10

        ClickableText {
            id: signInButton
            text: "Sign in"
            font.underline: (currentForm == "sign_in") ? true : false
            onClicked: {
                cursorShape: Qt.PointingHandCursor
                onClicked: (currentForm == "sign_up") ? currentForm = "sign_in" : currentForm = "sign_up"
            }
        }

        Text {
            id: slash
            text: "/"
            font.pixelSize: bottomButtonSize
            anchors.bottom: parent.bottom
            color: bottomButtonColor
        }

        ClickableText{
            id: signUpButton
            text: "Sign up"
            font.underline: (currentForm == "sign_up") ? true : false
            onClicked: {
                cursorShape: Qt.PointingHandCursor
                onClicked: (currentForm == "sign_in") ? currentForm = "sign_up" : currentForm = "sign_in"
            }
        }
    }
}
