import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Tab {
    id: portStatusCountersSubtabId
    active: true
    title: qsTr("port_status_counters")

    Connections {
        target: socketcontroller
    }

    ColumnLayout{
        TableView{
            id: portStatusCountersView
            objectName: "portStatusCountersView"
            Layout.fillWidth: true
            model: portStatusCountersModel
            property int coefficient: 7
            property int colWidth: portStatusCountersView.viewport.width / coefficient

            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            TableViewColumn{
                id: portColumn
                title: qsTr("port")
                role: "port"
                movable: false
                resizable: true
                width: portStatusCountersView.colWidth
            }

            TableViewColumn {
                id: rxPacketsCountColumn
                title: qsTr("rx_packets_count")
                role: "rx_packets_count"
                movable: false
                resizable: true
                width: portStatusCountersView.colWidth
            }

            TableViewColumn {
                id: rxBytesCountColumn
                title: qsTr("rx_bytes_count")
                role: "rx_bytes_count"
                movable: false
                resizable: true
                width: portStatusCountersView.colWidth
            }

            TableViewColumn {
                id: errorCountColumn
                title: qsTr("error_count")
                role: "error_Count"
                movable: false
                resizable: true
                width: portStatusCountersView.colWidth
            }

            TableViewColumn {
                id: txPacketsCountColumn
                title: qsTr("tx_packets_count")
                role: "tx_packets_count"
                movable: false
                resizable: true
                width: portStatusCountersView.colWidth
            }

            TableViewColumn {
                id: txBytesCountColumn
                title: qsTr("tx_bytes_count")
                role: "tx_bytes_count"
                movable: false
                resizable: true
                width: portStatusCountersView.colWidth
            }

            TableViewColumn {
                id: collisionsColumn
                title: qsTr("collisions")
                role: "collisions"
                movable: false
                resizable: true
                width: portStatusCountersView.width -
                       portStatusCountersView.colWidth*(portStatusCountersView.coefficient - 1)
            }
        }

        ListModel{
            id: portStatusCountersModel
            objectName: "portStatusCountersModel"

            function addPortStatusCounter(port_, rx_packets_count_, rx_bytes_count_,
                                          error_count_, tx_packets_count_, tx_bytes_count_,
                                          collisions_)
            {
                append({port: port_, rx_packets_count: rx_packets_count_,
                           rx_bytes_count: rx_bytes_count_,
                           error_count: error_count_,
                           tx_packets_count: tx_packets_count_,
                           tx_bytes_count: tx_bytes_count_,
                           collisions: collisions_})
            }

            function getChild(index)
            {
                return get(index)
            }
        }
    }
}
