public class MapInParensTest {
    public void method() {
        String result = (new Map<ColorService.Color, String> {
            ColorService.Color.RED => 'hex_red',
            ColorService.Color.GREEN => 'hex_green',
            ColorService.Color.BLUE => 'hex_blue'
        }).get(ColorService.getInstance().getCurrentColor());
    }
}
