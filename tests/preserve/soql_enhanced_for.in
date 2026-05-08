public class Test {
    void m() {
        for (Account acc : [
            SELECT Id, Name
            FROM Account
            WHERE Type = 'Customer'
            AND BillingCountry in ('USA', 'UK', 'NL', 'DE')
        ]) {
            process(acc);
        }
    }
}
