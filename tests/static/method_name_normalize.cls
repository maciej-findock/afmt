public class A {
  void m() {
    Blob b = Blob.valueOf('hello');
    String s = String.valueOf(42);
    Date d = Date.today();
    response.responseBody = Blob.valueOf(JSON.serialize(result));
  }
}
