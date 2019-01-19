class IconPrinter {

    private var fc;
    private var bc;

    private var btIcon;
    private var battIcon;

    public function print(l, f) {
        setColors();
        btIcon = new BtIcon();
        
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

}