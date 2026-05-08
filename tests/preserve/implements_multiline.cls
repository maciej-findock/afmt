public class Compact implements IFoo, IBar {
    void m() {
    }
}

public class Wrapped implements IFooInterface, IBarInterface, IBazInterface,
        IQuxInterface {
    void m() {
    }
}

public class ThreeLines implements IFooInterface, IBarInterface,
        IBazInterface, IQuxInterface,
        IQuuxInterface {
    void m() {
    }
}
