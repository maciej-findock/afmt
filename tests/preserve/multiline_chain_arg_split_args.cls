public class A {
    public void m() {
        Object value = ServiceFactory
            .buildValue(SelectorFactory.selectAllByName()
                .get(this.input.key),
                this.input.item);
    }
}
