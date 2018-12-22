class MHandPrinter {

    private var clockTime;
    private var penWidth;
    private var w;
    private var arborWidth;
    private var fc;
    private var bc;

    public function init(arg) {
        clockTime = arg;
        penWidth = 1;
        w = 12;
        arborWidth = 12;
    }

    public function print(l) {
        setColors();
        printHand(l);
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

    private function printHand(l) {
        if (l.success()) {
            var c = l.context();
            var angle = (clockTime.min / 30.0) * Math.PI;
            var pts = generateCoordinates(l.center()
                                        , angle
                                        , (l.size()[0] / 2) - 18
                                        , -(Math.sqrt(Math.pow(arborWidth, 2) - Math.pow(w / 2 , 2)))
                                        , w);
            c.setColor(fc, bc);
            c.setPenWidth(penWidth);
            c.drawLine(pts[0][0], pts[0][1], pts[1][0], pts[1][1]);
            c.drawLine(pts[1][0], pts[1][1], pts[2][0], pts[2][1]);
            c.drawLine(pts[2][0], pts[2][1], pts[3][0], pts[3][1]);
            c.drawLine(pts[3][0], pts[3][1], pts[4][0], pts[4][1]);
        }
    }

    private function generateCoordinates(center, angle, handLength, tailLength, handWidth) {
        var coords = [
            [ -(handWidth / 2), tailLength ],
            [ -(handWidth / 2), -(handLength * 4 / 5) ],
            [ 0, -(handLength) ],
            [ handWidth / 2, -(handLength * 4 / 5) ],
            [ handWidth / 2, tailLength ]
        ];

        var cos = Math.cos(angle);
        var sin = Math.sin(angle);

        var ret = new [ 5 ];
        for (var i = 0; i < 5; ++i) {
            var x = (coords[i][0] * cos) - (coords[i][1] * sin) + 0.5;
            var y = (coords[i][0] * sin) + (coords[i][1] * cos) + 0.5;
            ret[i] = [ center[0] + x, center[1] + y ];
        }

        return ret;
    }

}