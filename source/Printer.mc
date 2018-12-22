class Printer {

    private var partialAllowed;
    private var awake;
    private var basicPalette = [
        Graphics.COLOR_BLACK,
        Graphics.COLOR_WHITE
    ];
    private var l;
    private var f;
    private var dialPrinter;
    private var hHandPrinter;
    private var mHandPrinter;
    private var datePrinter;
    private var sHandPrinter;

    public function AllowPartial(arg) {
        partialAllowed = arg;
    }

    public function Awaken(arg) {
        awake = arg;
    }

    public function initialize(argDc) {
        awake = true;
        tryAllocLayers(argDc);
        f = WatchUi.loadResource(Rez.Fonts.id_font_font);
        allocPrinters();
        if (l.success()) {
            sHandPrinter = new SHandPrinter(l.size(), l.center());
        }
    }

    public function run(argDc) {
        argDc.clearClip();
        dialPrinter.print(l);
        hHandPrinter.init(System.getClockTime());
        hHandPrinter.print(l);
        mHandPrinter.init(System.getClockTime());
        mHandPrinter.print(l);
        datePrinter.print(l, f);
        if (l.success()) {
            argDc.drawBitmap(0, 0, l.buffer());
            if (partialAllowed) {
                sHandPrinter.printWithClip(argDc, System.getClockTime());
            } else if (awake) {
                sHandPrinter.print(argDc, System.getClockTime());
            }
        }
    }

    public function runPartial(argDc) {
        if (partialAllowed) {
            if (l.success()) {
                argDc.drawBitmap(0, 0, l.buffer());
                sHandPrinter.printWithClip(argDc, System.getClockTime());
            }
        }
    }

    private function tryAllocLayers(arg) {
        l = new BBLayer();
        l.tryAllocWithPalette(arg, basicPalette);
    }

    private function allocPrinters() {
        dialPrinter = new DialPrinter();
        hHandPrinter = new HHandPrinter();
        mHandPrinter = new MHandPrinter();
        datePrinter = new DatePrinter();
    }

}