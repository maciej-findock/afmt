@IsTest
public class A {
  @TestSetup
  static void setup() {
  }

  @TestVisible
  private static Integer count = 0;

  @AuraEnabled(cacheable=true)
  public static String getData() {
    return 'data';
  }

  @Future
  public static void runAsync() {
  }

  @SuppressWarnings('PMD')
  public void m() {
  }
}
