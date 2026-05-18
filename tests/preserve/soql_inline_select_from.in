public class A {
    void m() {
        List<Account> results = [SELECT Id, Name FROM Account
            WHERE IsActive = true AND Name = 'Test'];

        List<Contact> contacts = [SELECT Id, FirstName, LastName FROM Contact
            WHERE AccountId = :accountId
            ORDER BY LastName];
    }
}
