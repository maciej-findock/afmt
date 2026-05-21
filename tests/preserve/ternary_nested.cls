public class Test {
    void m() {
        String x = a == 1
            ? 'one'
            : a == 2
                ? 'two'
                : 'other';

        String y = a == 1
            ? 'one'
            : a == 2
                ? 'two'
                : a == 3
                    ? 'three'
                    : 'other';
    }
}
