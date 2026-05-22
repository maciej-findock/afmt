public class Test {
    void m() {
        records.add(new Foo__c(
            Field_A__c = val1,
            Field_B__c = val2,
            Field_C__c = val3
        ));

        if (condition) {
            for (String key : settings.keySet()) {
                records.add(new Bar__c(
                    Name__c = source.Name,
                    Key__c = key,
                    Value__c = settings.get(key)
                ));
            }
        }
    }
}
