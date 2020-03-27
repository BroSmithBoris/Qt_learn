import QtQuick 2.0
import QtQuick.Controls 2.12

Text{
    id: clickableText
    font.pixelSize: bottomButtonSize
    anchors.bottom: parent.bottom
    color: bottomButtonColor

    signal clicked();

    MouseArea{
        id: clickableTextMouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            clickableText.clicked();
        }
    }
}
