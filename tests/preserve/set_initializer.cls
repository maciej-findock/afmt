public class Test {
    void m() {
        Set<String> wrapped = new Set<String> { 'ItemA', 'ItemB', 'ItemC', 'ItemD', 'ItemE', 'ItemF', 'ItemG' };

        Set<String> compact = new Set<String> { 'ItemA', 'ItemB', 'ItemC' };

        Set<String> expanded = new Set<String> {
            'ItemA',
            'ItemB',
            'ItemC'
        };
    }
}
