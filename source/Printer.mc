class Printer {

    private var partialAllowed;
    private var awake;
    private var basicPalette = [
        Graphics.COLOR_BLACK,
        Graphics.COLOR_WHITE
    ];
    private var l;
    private var dialPrinter;
    private var hHandPrinter;
    private var mHandPrinter;
    private var datePrinter;
    private var sHandPrinter;
    private var iconPrinter;
    private var minutesDuringRunPartial;

    public function AllowPartial(arg) {
        partialAllowed = arg;
    }

    public function Awaken(arg) {
        awake = arg;
        if (awake) {
            minutesDuringRunPartial = 0;
        }
    }

    public function initialize(argDc) {
        awake = true;
        tryAllocLayers(argDc);
        allocPrinters();
        if (l.success()) {
            sHandPrinter = new SHandPrinter(l.size(), l.center());
        }
        minutesDuringRunPartial = 0;
    }

    public function run(argDc) {
        argDc.clearClip();
        dialPrinter.print(l);
        hHandPrinter.print(l);
        mHandPrinter.print(l);
        datePrinter.print(l);
        iconPrinter.print(l);
        if (l.success()) {
            argDc.drawBitmap(0, 0, l.buffer());
        }
        if (Application.getApp().getProperty("MinutesShowSecondHand") >= minutesDuringRunPartial) {
            ++minutesDuringRunPartial;
        }
        if (l.success() && (Application.getApp().getProperty("MinutesShowSecondHand") > minutesDuringRunPartial)) {
            if (partialAllowed) {
                sHandPrinter.printWithClip(argDc);
            } else if (awake) {
                sHandPrinter.print(argDc);
            }
        }
    }

    public function runPartial(argDc) {
        if (l.success()  && (Application.getApp().getProperty("MinutesShowSecondHand") > minutesDuringRunPartial)) {
            if (partialAllowed) {
                argDc.drawBitmap(0, 0, l.buffer());
                sHandPrinter.printWithClip(argDc);
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
        iconPrinter = new IconPrinter();
    }

}