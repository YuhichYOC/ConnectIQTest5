class DatePrinter {

    private var dateFont;
    private var fc;
    private var bc;

    public function initialize() {
        dateFont = WatchUi.loadResource(Rez.Fonts.id_font_font);
    }

    public function print(l) {
        if (l.success()) {
            setColors();
            var d = Toybox.Time.Gregorian.info(Toybox.System.Time.now(), Toybox.System.Time.FORMAT_SHORT);
            var s = dowToString(d.day_of_week) + " " + monthToString(d.month) + " " + Lang.format("$1$", [ d.day ]);
            var c = l.context();
            c.setColor(fc, bc);
            c.drawText(l.center()[0]
                     , l.center()[1] + l.center()[1] / 6
                     , dateFont
                     , s
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

    private function dowToString(arg) {
        if (1 == arg) {
            return "Sun";
        } else if (2 == arg) {
            return "Mon";
        } else if (3 == arg) {
            return "Tue";
        } else if (4 == arg) {
            return "Wed";
        } else if (5 == arg) {
            return "Thu";
        } else if (6 == arg) {
            return "Fri";
        } else {
            return "Sat";
        }
    }

    private function monthToString(arg) {
        if (1 == arg) {
            return "Jan";
        } else if (2 == arg) {
            return "Feb";
        } else if (3 == arg) {
            return "Mar";
        } else if (4 == arg) {
            return "Apr";
        } else if (5 == arg) {
            return "May";
        } else if (6 == arg) {
            return "Jun";
        } else if (7 == arg) {
            return "Jul";
        } else if (8 == arg) {
            return "Aug";
        } else if (9 == arg) {
            return "Sep";
        } else if (10 == arg) {
            return "Oct";
        } else if (11 == arg) {
            return "Nov";
        } else {
            return "Dec";
        }
    }

}