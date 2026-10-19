import QtQuick
import Quickshell
import Quickshell.Services.Pam

Scope {
    property string text: ""

    signal unlocked()

    PamContext {
        onPamMessage: {
            if (responseRequired)
                respond(text);

        }
    }

}
