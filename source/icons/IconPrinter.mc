class IconPrinter {

    private var iconFont;
    private var fc;
    private var bc;

    public function initialize() {
        iconFont = WatchUi.loadResource(Rez.Fonts.id_font_icon);
    }

    public function print(l) {
        if (l.success()) {
            setColors();
            var c = l.context();
            c.setColor(fc, bc);
            c.drawText(l.center()[0]
                     , l.center()[1] - l.center()[1] / 2
                     , iconFont
                     , toString()
                     , Toybox.Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    private function setColors() {
        if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
            fc = Graphics.COLOR_WHITE;
            bc = Graphics.COLOR_TRANSPARENT;
        } else {
            fc = Graphics.COLOR_BLACK;
            bc = Graphics.COLOR_TRANSPARENT;
        }
    }

    private function toString() {
        return batteryToString() + btToString() + notifyToString() + dndToString();
    }

    private function batteryToString() {
        var b = System.getSystemStats().battery;
        if (10 >= b) {
            return "a";
        } else if (25 >= b) {
            return "b";
        } else if (50 >= b) {
            return "c";
        } else if (75 >= b) {
            return "d";
        } else {
            return "e";
        }
    }

    private function btToString() {
        if (System.getDeviceSettings().phoneConnected) {
            return "f";
        } else {
            return "";
        }
    }

    private function notifyToString() {
        var n = System.getDeviceSettings().notificationCount;
        if (3 <= n) {
            return "j";
        } else if (2 <= n) {
            return "i";
        } else if (1 <= n) {
            return "h";
        } else {
            return "g";
        }
    }

    private function dndToString() {
        if (System.getDeviceSettings().doNotDisturb) {
            return "k";
        } else {
            return "";
        }
    }

}