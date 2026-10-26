import QtQuick
import QtQuick
import Quickshell
import Quickshell
import Quickshell.Services.Pam
import Quickshell.Services.Pam

Scope {
    id: root

    property string password: ""
    property bool failed: false
    readonly property bool busy: pam.active

    signal unlocked()

    function submit(pw) {
        if (pam.active || pw === "")
            return ;

        failed = false;
        password = pw;
        pam.start();
    }

    PamContext {
        id: pam

        configDirectory: "pam"
        config: "password.conf"
        onResponseRequiredChanged: {
            if (responseRequired) {
                respond(root.password);
                root.password = ""; // dont save password lol
            }
        }
        onCompleted: (result) => {
            if (result === PamResult.Success)
                root.unlocked();
            else
                root.failed = true;
        }
    }

}
