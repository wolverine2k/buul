import QtQuick 2.0

Item {
    id: tile
    width: 80
    height: 80

    // Tile background rectangle
    Image {
        source: "images/tile_background.png"
        opacity: {
            if (modelData.highlighted)
                return 1.0
            else
                return 0.6
        }
        Behavior on opacity {
            enabled: gameData.moves !== 0
            NumberAnimation {
                properties:"opacity"
                duration: 500
            }
        }
    }
    // Tile Button
    Image {
        anchors.centerIn: parent
        source: {
            if (modelData.hasButton1)
                "images/tile_button1.png"
            else if (modelData.hasButton2)
                "images/tile_button2.png"
            else
                ""
        }
        opacity: modelData.hasButton1 || modelData.hasButton2
        Behavior on opacity {
            enabled: gameData.moves != 0
            NumberAnimation {
                properties: "opacity"
                duration: 1500
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        enabled: !modelData.hasButton1 && !modelData.hasButton2
        onClicked: {
            explosion.explode()
            gameData.flip(index)
        }
    }
    Explosion {
        id: explosion
    }
}
