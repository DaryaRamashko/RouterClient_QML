import QtQuick 2.3
import QtQuick.Dialogs 1.2

Item {
    MessageDialog {
        id: messageDialog
        title: qsTr("important")
        icon: StandardIcon.Information

        onAccepted: {
            doAction();
        }
    }

    function show(caption)
    {
        messageDialog.text = caption;
        messageDialog.open();
    }

    function doAction()
    {
        // should be overrided
    }
}
