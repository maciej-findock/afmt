public class Test {
    String m() {
        return cachedValue != null
                ? cachedValue
                : map.get(FALLBACK_KEY);
    }

    String n() {
        return a != null ? a : b;
    }

    String p() {
        String x = someCondition
                ? valueA
                : valueB;
        return x;
    }
}
