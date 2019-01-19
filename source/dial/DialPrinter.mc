class DialPrinter {

    private var dialFont;
    private var fc;
    private var bc;

    public function initialize() {
        dialFont = WatchUi.loadResource(Rez.Fonts.id_font_dial);
    }

    public function print(l) {
        setColorsToFill();
        fill(l);
        setColorsToPrint();
        printDial(l);
    }

    private function setColorsToFill() {
        if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
            fc = Graphics.COLOR_BLACK;
            bc = Graphics.COLOR_WHITE;
        } else {
            fc = Graphics.COLOR_WHITE;
            bc = Graphics.COLOR_BLACK;
        }
    }

    private function fill(l) {
        if (l.success()) {
            var c = l.context();
            c.setColor(fc, bc);
            c.fillRectangle(0, 0, l.size()[0], l.size()[1]);
        }
    }

    private function setColorsToPrint() {
        if (0x000000 == Application.getApp().getProperty("BackgroundColor")) {
            fc = Graphics.COLOR_WHITE;
            bc = Graphics.COLOR_TRANSPARENT;
        } else {
            fc = Graphics.COLOR_BLACK;
            bc = Graphics.COLOR_TRANSPARENT;
        }
    }

    private function printDial(l) {
        if (l.success()) {
            var c = l.context();
            c.setColor(fc, bc);
            c.drawText(0
                     , 0
                     , dialFont
                     , "d"
                     , Toybox.Graphics.TEXT_JUSTIFY_LEFT);
        }
    }

}