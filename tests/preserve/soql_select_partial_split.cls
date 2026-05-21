public class Test {
    void m() {
        Account r1 = [SELECT Id, Name, Phone, Email__c,
                CreatedDate, LastModifiedDate FROM Account];

        return [
            SELECT Id, Name, Phone,
                Email__c, CreatedDate,
                LastModifiedDate
            FROM Account
            WHERE IsActive__c = true
        ];
    }
}
