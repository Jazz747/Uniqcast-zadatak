import QtQuick 2.6
import QtQuick.Window 2.2
import "./methods.js" as Methods
import QtQuick.Controls 2.2


Window {
    id: window
    visible: true
    width: 800
    minimumWidth: 800
    height: 500
    minimumHeight: 500
    title: qsTr("Zadatak")

    Rectangle {
        id: rectangle
        x: 238
        y: 61
        width: 308
        height: 450
        color: "#ffffff"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        state: "LOGIN"

        states: [
            State {
                name: "LOGIN"
                PropertyChanges {target: rectangle; visible: true}
                PropertyChanges {target: channelOkvir; visible: false}

            },
            State {
                name: "CHANNELS"
                PropertyChanges {target: rectangle; visible: false}
                PropertyChanges {target: channelOkvir; visible: true}

            }
        ]

        Rectangle {
            id: rectangle3
            x: 49
            width: 205
            height: 79
            color: "#ffffff"
            anchors.horizontalCenterOffset: 0
            border.width: 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 300

            Text {
                id: text3
                x: 91
                y: 33
                text: qsTr("LOG IN")
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 20
            }

            MouseArea {
                hoverEnabled: true
                id: mouseArea
                anchors.fill: parent
                onEntered: rectangle3.color = "#eeeeee"
                onExited: rectangle3.color = "white"
                onPressed:  rectangle3.color = "#acacac"
                onReleased: rectangle3.color = "#eeeeee"
                onClicked: {
                    Methods.logIn()
                    busyIndicator.running = true
                    errorText.text = ''
                }
            }
        }

        Text {
            id: text1
            x: 51
            y: 29
            text: qsTr("User Name")
            anchors.bottom: usernameInput.top
            anchors.bottomMargin: 10
            font.pixelSize: 14
        }

        Text {
            id: text2
            x: 51
            y: 111
            text: qsTr("Input PIN")
            anchors.bottom: pinInput.top
            anchors.bottomMargin: 10
            font.pixelSize: 14
        }

        BusyIndicator {
            id: busyIndicator
            x: 124
            running: false
            anchors.top: pinInput.bottom
            anchors.topMargin: 30

            ColorAnimation {
                from: "white"
                to: "black"
                duration: 50
            }
        }

        Text {
            id: errorText
            x: 133
            width: 205
            height: 14
            color: "#c00000"
            text: qsTr("")
            horizontalAlignment: Text.AlignHCenter
            anchors.top: rectangle3.bottom
            anchors.topMargin: 19
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 15
        }

        TextField {
            id: usernameInput
            x: 54
            width: 200
            height: 40
            text: qsTr("")
            font.pointSize: 11
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
        }

        TextField {
            id: pinInput
            x: 56
            echoMode: TextInput.Password
            font.pointSize: 10
            anchors.top: usernameInput.bottom
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


    Rectangle {
        id: channelOkvir
        color: "#ffffff"
        visible: true
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.fill: parent

        states: [
            State {
                name: "LOGIN"
                PropertyChanges {target: rectangle; visible: false}
            },
            State {
                name: "CHANNELS"
                PropertyChanges {target: rectangle; visible: true}
            }
        ]

        Rectangle {
            id: rectangle5
            color: "#ffffff"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: rectangle4.bottom
            anchors.topMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            ListView {
                id: listView
                anchors.topMargin: 30
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.fill: parent
                model: listaModel
                delegate: delegat

                BusyIndicator {
                    id: loading
                    x: 340
                    y: 160
                    running: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }

            }
            ListModel {
                id: listaModel
            }
            Component {
                id: delegat
                Row {
                    id: row
                    anchors.top: rectangle.bottom
                    anchors.topMargin: -454
                    anchors.bottom: rectangle.top
                    anchors.bottomMargin: 46
                    anchors.horizontalCenter: rectangle.horizontalCenter
                    anchors.verticalCenter: rectangle.verticalCenter

                    Rectangle {
                        id: rectangle6
                        width: 150
                        height: 30
                        color: "#ffffff"
                        border.color: "#b9b9b9"
                        border.width: 1

                        Text {
                            id: channelName
                            y: 91; text: name
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 15
                            anchors.verticalCenter: parent.verticalCenter
                            property string mjau: channelName.text
                        }
                    }


                    Rectangle {
                        id: rectangle8
                        width: 150
                        height: 30
                        color: "#ffffff"
                        border.color: "#b9b9b9"
                        border.width: 1

                        Text {
                            id: channelUrl
                            y: 91; text: url
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 15
                            anchors.verticalCenter: parent.verticalCenter

                        }
                    }

                    Rectangle {
                        id: rectangle7
                        width: 150
                        height: 30
                        color: "#ffffff"
                        border.color: "#b9b9b9"
                        border.width: 1

                        Text {
                            id: channelId
                            y: 91
                            text: id
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 15

                        }
                    }

                    Rectangle {
                        id: rectangle9
                        width: 160
                        height: 30
                        color: "#ffffff"
                        border.color: "#b9b9b9"
                        border.width: 1

                        Button {
                            id: editChannelButton
                            width: 60
                            height: 20
                            text: qsTr("Edit")
                            font.pointSize: 10
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            onClicked: function() {
                                editChannelWindow.open()
                            }
                        }

                        Button {
                            id: deleteChannelButton
                            y: 0
                            width: 60
                            height: 20
                            text: qsTr("Delete")
                            font.pointSize: 10
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: editChannelButton.right
                            anchors.leftMargin: 20
                            onClicked: Methods.deleteChannel(channelId.text)
                        }
                    }
                }
            }
        }

        Rectangle {
            id: rectangle4
            height: 60
            color: "#ffffff"
            border.color: "#929292"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0

            Button {
                id: addChannelButton
                x: 648
                y: 12
                text: qsTr("Add a channel")
                font.pointSize: 10
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                onClicked: addChannelWindow.open()

            }

            Text {
                id: text4
                y: 23
                text: qsTr("Channels")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                font.pixelSize: 30
            }

            Button {
                id: refreshChannelsButton
                x: 514
                y: 10
                width: 122
                height: 40
                text: qsTr("Refresh channels")
                font.pointSize: 10
                anchors.right: addChannelButton.left
                anchors.rightMargin: 25
                onClicked: Methods.refreshChannels()
            }
        }
    }



    Window {
        id: addChannelWindow
        title: "Adding a channel"
        width: 200
        minimumWidth: 200
        maximumWidth: 200
        height: 300
        minimumHeight: 300
        maximumHeight: 300

        function open(){
            visible = true
        }
        function close(){
            visible = false
        }

        Rectangle {
            id: frame
            color: "#ffffff"
            anchors.fill: parent

            Text {
                id: text5
                text: qsTr("Channel name:")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: nameInput.top
                anchors.bottomMargin: 10
                font.pixelSize: 15
            }

            TextField {
                id: nameInput
                horizontalAlignment: Text.AlignLeft
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 30
            }

            Text {
                id: warningText
                color: "#db0000"
                text: qsTr("")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: nameInput.bottom
                anchors.topMargin: 5
                font.pixelSize: 12
            }

            Text {
                id: text7
                text: qsTr("Channel URL:")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: urlInput.top
                anchors.bottomMargin: 10
                font.pixelSize: 15
            }

            TextField {
                id: urlInput
                text: qsTr("")
                horizontalAlignment: Text.AlignLeft
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: nameInput.bottom
                anchors.topMargin: 80
                validator: RegExpValidator {regExp: /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/ }
            }

            Button {
                id: addNewChannelButton
                y: 20
                text: qsTr("Add channel")
                font.pointSize: 12
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                onClicked: function() {
                    if (nameInput.text.length == 0)
                        warningText.text = 'Channel name must not be empty.'
                    else {
                        Methods.addChannel(nameInput.text, urlInput.text)
                        addNewChannelButton.text = 'Adding channel...'
                    }
                }
            }
        }


    }

    Window {
        id: editChannelWindow
        title: "Editing channel"
        width: 200
        minimumWidth: 200
        maximumWidth: 200
        height: 300
        minimumHeight: 300
        maximumHeight: 300

        function open(){
            visible = true
        }
        function close(){
            visible = false
        }


        Rectangle {
            id: frame2
            color: "#ffffff"
            anchors.fill: parent

            Text {
                id: text51
                text: qsTr("Channel name:")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: nameEdit.top
                anchors.bottomMargin: 10
                font.pixelSize: 15
            }

            TextField {
                id: nameEdit
                text: qsTr("")
                horizontalAlignment: Text.AlignLeft
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 30
            }

            Text {
                id: warningText2
                color: "#db0000"
                text: qsTr("")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: nameEdit.bottom
                anchors.topMargin: 5
                font.pixelSize: 12
            }

            Text {
                id: text71
                text: qsTr("Channel URL:")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: urlEdit.top
                anchors.bottomMargin: 10
                font.pixelSize: 15
            }

            TextField {
                id: urlEdit
                text: qsTr("")
                horizontalAlignment: Text.AlignLeft
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.top: nameEdit.bottom
                anchors.topMargin: 80
                validator: RegExpValidator {regExp: /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/ }
            }

            Button {
                id: editChannelButton
                y: 20
                text: qsTr("Edit channel")
                font.pointSize: 12
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                onClicked: function() {
                    console.log(mjau)
                    if (nameEdit.text.length == 0)
                        warningText2.text = 'Channel name must not be empty.'
                    else {
                        Methods.editChannel(nameEdit.text, urlEdit.text, channelId.text)
                        addNewChannelButton.text = 'Editing channel...'
                    }
                }
            }
        }
    }
}
