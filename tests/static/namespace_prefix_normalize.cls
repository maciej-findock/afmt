global class A
  extends ns.BaseClass implements ns.IFirst, ns.ISecond, Schema.SObjectType {
  ns.SomeType field;

  void m(ns.ParamType p) {
    ns.Helper h = new ns.Helper();
  }
}
