public class PropertyGetterTest {
    public static final String cachedLabel {
        get {
            if (cachedLabel == null) {
                String key = (new Map<ColorService.Color, String> {
                    ColorService.Color.RED => 'hex_red',
                    ColorService.Color.GREEN => 'hex_green',
                    ColorService.Color.BLUE => 'hex_blue'
                }).get(ColorService.getInstance().getCurrentColor());
                cachedLabel = Settings__mdt.getInstance(key).Label__c;
            }
            return cachedLabel;
        }
        set;
    }
}
