using Toybox.Application;

class ConnectIQTest5App extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    }

    function onStop(state) {
    }

    function getInitialView() {
        if (Toybox.WatchUi has :WatchFaceDelegate) {
            return [ new ConnectIQTest5View(), new ConnectIQTest5Delegate() ];
        } else {
            return [ new ConnectIQTest5View() ];
        }
    }

}