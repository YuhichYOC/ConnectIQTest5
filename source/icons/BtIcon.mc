class BtIcon {

    public function print(l, f, fc, bc) {
        if (l.success() && System.getDeviceSettings().phoneConnected) {
            var c = l.context();
            c.setColor(fc, bc);
            c.drawText(l.center()[0]
                     , l.center()[1] - l.center()[1] / 6
                     , f
                     , "`"
                     , Toybox.Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

}