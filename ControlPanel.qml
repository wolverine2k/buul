import QtQuick 2.4

Item {
    id: controlPanel
    width: 180
    height: parent.height

    Item {
        // This is the part of panel which rotates
        id: rotablePanel
        width: parent.width
        height: 290
        transformOrigin: Item.Center

        Frame {
            id: box1
            height: 80
            y: 10

            Text {
                x: 25
                y: 5
                font.family: "Helvetica"
                font.pointSize: 12
                smooth: true
                color: "black"
                text: "Time"
            }
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 15
                y: 5
                font.family: "Helvetica"
                font.pointSize: 12
                smooth: true
                color: "black"
                text: "Moves"
            }
            Text {
                x: 10
                y: 25
                font.family: "Helvetica"
                font.pointSize: 26
                smooth: true
                color: "gray"
                style: Text.Outline
                styleColor: "black"
                text: gameData.gameTime
            }
            Text {
                anchors.right: parent.right
                anchors.rightMargin: 20
                y: 25
                font.family: "Helvetica"
                font.pointSize: 26
                smooth: true
                color: "gray"
                style: Text.Outline
                styleColor: "black"
                text: gameData.moves
            }

        }

        Frame {
            id: box2
            height: 180
            anchors.top: box1.bottom
            anchors.topMargin: 10

            Image {
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                source: {
                    if (gameData.player1Turn)
                        "images/tile_button1.png"
                    else
                        "images/tile_button2.png"
                }
            }
            Text {
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: "Helvetica"
                font.pointSize: 28
                smooth: true
                color: "white"
                style: Text.Outline
                styleColor: "black"
                text: {
                    if (gameData.player1Turn)
                        "Player 1"
                    else
                        "Player 2"
                }
            }

            Button {
                id: buttonUndo
                height: 80
                width: parent.width - 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Undo"
                opacity: gameData.gameOn
                disabled: !gameData.moves
                onClicked: {
                    gameData.undoTile()
                }
            }
            Text {
                anchors.centerIn: buttonUndo
                font.family: "Helvetica"
                font.pointSize: 42
                smooth: true
                color: "white"
                style: Text.Outline
                styleColor: "black"
                text: "Wins!"
                opacity: !gameData.gameOn
            }
        }
    }

    Frame {
        id: box3
        height: 80
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10

        Button {
            id: buttonMainMenu
            width: parent.width - 20
            anchors.centerIn: parent
            text: "Main Menu"
            onClicked: {
                menuPanel.state = ""
                gameData.pauseGame(true)
            }
        }
    }

    states: State {
        name: "Turned"
        when: !gameData.player1Turn
        PropertyChanges {
            target: rotablePanel
            rotation: 180
        }
    }

    transitions: Transition {
        NumberAnimation {
            properties: "rotation"
            easing.type: Easing.OutBack
            duration: 800
        }
    }

}
