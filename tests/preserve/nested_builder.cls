public class Test {
    void m() {
        List<Map<String, String>> defs = new List<Map<String, String>> {
            new Map<String, String> {
                'rules' => builder.listOfRules()
                    .add(builder.queryRule('ALPHA', SObjectA.FieldA__c, 'Rule A')
                        .query(SObjectA.Id, SObjectA.FieldA__c)
                        .qc(SObjectA.FieldB__c, 'equals', 'true')
                        .build())
                    .add(builder.queryRule('BETA', SObjectA.FieldC__c, 'Rule B')
                        .query(SObjectA.Id, SObjectA.FieldC__c)
                        .qc(SObjectA.FieldD__c, 'notEquals')
                        .build())
            }
        };
    }
}
