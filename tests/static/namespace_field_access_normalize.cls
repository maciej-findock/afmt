public class A {
  void m() {
    ns.ServiceClass.doWork();
    ns.ServiceClass.configure(param);
    ns.ServiceClass.doWork();
    String s = JSON.serialize(result);
    response.responseBody = Blob.valueOf(JSON.serialize(result));
  }
}
