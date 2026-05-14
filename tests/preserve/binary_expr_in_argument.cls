public class A {
    void m() {
        String result = String.format(
            'SELECT {0} ' +
            'FROM {1} ' +
            'WHERE Id IN :ids',
            new List<String> {getFields(),
                getObject()});
    }
}
