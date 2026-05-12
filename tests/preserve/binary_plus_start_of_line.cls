public class A {
    void m() {
        String query = 'SELECT ' + someExpr
            + ' FROM ' + objectName
            + ' WHERE Id = :idValue';
    }
}
