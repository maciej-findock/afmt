public class MapInArgumentListTest {
    public void method() {
        SomeType someObject
            = getResult(new Map<String, Object> {
                'isClose' => true,
                'count' => 5
            });

        doThing(new Map<String, Boolean> {
            'isClose' => true,
            'isOpen' => false
        });
    }
}
