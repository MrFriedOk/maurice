import Quickshell.Io
import Quickshell
import QtQuick
import "../../data" as D

Scope {
    id: fetch
    Process {
        id: fetchProc
        property string lrc: ""
        property string url: ""
        command: ['curl', '-s', '-A', '-f', "maurice 0.4.0 (https://github.com/MrFriedOk/maurice)", url]

        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    const res = JSON.parse(text);
                    const hit = Array.isArray(res) ? res[0] : res;
                    fetchProc.lrc = hit?.syncedLyrics ?? "no lyrics?";

                    console.log(fetchProc.lrc);
                } catch (e) {
                    fetchProc.lrc = "couldn't fetch \nlyrics!";
                }
            }
        }
    }
    function fetch(p) {
        const q = [p.trackArtist, p.trackTitle].map(encodeURIComponent).join("%20");
        fetchProc.url = "https://lrclib.net/api/search?q=" + q;
        fetchProc.running = true;

        return fetchProc.lrc;
    }
}
