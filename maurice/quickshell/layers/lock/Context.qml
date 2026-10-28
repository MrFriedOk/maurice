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
        // check the docs for the exact signal name
        //onCompleted: (result) => {
        //   return console.log("pam completed:", result);
        //}

        id: pam

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
        configDirectory: Quickshell.shellPath("data/pam")
        config: "password.conf"
        //onActiveChanged: console.log("pam active:", active)
        //onMessageChanged: console.log("pam message:", message, "| isError:", messageIsError)
        //onResponseRequiredChanged: console.log("pam responseRequired:", responseRequired)
        onError: (err) => {
            return console.log("pam error:", err);
        }
    }

}
