import QtQuick 2.15
import QtQuick.Window 2.15
//for application window supporting header and footer
import QtQuick.Controls 2.5
//for materials
import QtQuick.Controls.Material 2.3
//for layout
import QtQuick.Layouts 1.3

//Window {
//    width: 600
//    height: 800
//    visible: true
//    title: qsTr("Image Viewer")
//}


ApplicationWindow {
    width: 600
    height: 800
    visible: true
    title: qsTr("Image Viewer")

    //set the primary color factors
    Material.primary: "steelblue"
    Material.background: "lightgrey"

    header: ToolBar{
        id:mainToolBar
        Material.foreground: "white"

        RowLayout{
            anchors.fill: parent
            ToolButton{
                contentItem: Image {
//                    id: name
                    fillMode: Image.Pad
                    source: "qrc:/img/baseline_menu_white_48dp.png"
                }
                onClicked: mainDrawer.open()

            }//end of toolbutton
            Label{
                text: qsTr("Images")
                font.pointSize: 14
                font.bold: true
                horizontalAlignment: Qt.AlignHCenter
                Layout.fillWidth: true

            }//end of the label

            ToolButton{
                contentItem: Image {
                    fillMode: Image.Pad
                    source: "qrc:/img/baseline_settings_white_48dp.png"
                }
                onClicked: mainMenu.open()

            }//end of toolbutton


            Menu{
                id: mainMenu
                y:mainToolBar.height
                x:mainToolBar.width
                MenuItem{
                    text: qsTr("Quit")
                    onTriggered: Qt.quit()
                }

            }//end of menu
        }//end of row layout

    }//end of the header


    Drawer{
        id: mainDrawer
        width: parent.width * 0.6
        height: parent.height

        ListView{
            id: mainSelector
            anchors.fill: parent
            anchors.margins: 20
            anchors.topMargin: 30
            spacing: 20

            model: imageModel
            delegate: Column{
                width: parent.width
                spacing: 5
                Image {
                    fillMode: Image.PreserveAspectFit
                    width: parent.width

                    source: model.url
                    MouseArea{
                        anchors.fill: parent
                        onClicked: mainSelector.currentIndex = index
                    }//end of the mouse error
                }
                Label{
                    text: model.name
                    anchors.horizontalCenter: parent.horizontalCenter

                }//end of the label

            }//end of the Column

        }//end of the list view

    }//end of the drawer

    Image {
        id: centralImage
        anchors.fill: parent
        anchors.margins: 20
        fillMode: Image.PreserveAspectFit
        source: imageModel.get(mainSelector.currentIndex).url
    }//end of the main image

    ListModel{
        id:imageModel
        ListElement{name: "img1.jpg"; url:"qrc:/img/img1.jpg"}
        ListElement{name: "img2.jpg"; url:"qrc:/img/img2.jpg"}
        ListElement{name: "img3.jpg"; url:"qrc:/img/img3.jpg"}


    }//end og list model
}//end of the appliation window
