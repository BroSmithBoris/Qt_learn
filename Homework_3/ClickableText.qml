import QtQuick 2.0
import QtQuick.Controls 2.12

Text{
    id: clickableText
    font.pixelSize: 17
    anchors.bottom: parent.bottom
    color: "#404040"

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
