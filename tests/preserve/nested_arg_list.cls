public class Test {
    void m() {
        result =
            processPayment(
                this.validateRequestParameters(requestClass, processor),
                relationWrapper
            );

        a.b(c.d(e.f(
                arg1,
                arg2
        )));

        outer(inner(new Map<String, Object> {
            'k' => true
        }));

        a.setMock(new A.MockList(new List<A.Mock> {
            new A.Mock(A.Method.DO, 200, body)
        }));

        Foo helper = new Foo(new List<SObjectField> {
            Obj__c.Field_A__c
        });

        a.setMock(new A.MockList(new List<A.Mock> {
            new A.Mock(A.Method.DO, 200, bodyA),
            new A.Mock(A.Method.DO, 201, bodyB)
        }));

        Bar bar = new Bar(new List<SObjectField> {
            Obj__c.Field_A__c,
            Obj__c.Field_B__c
        });

        Factory f = new Factory(
            new List<SObjectType> {
                Account.SObjectType,
                Contact.SObjectType
            }
        );

        Recurring_Payment_Schedule__c rps = createRPS(DAILY,
            Date.newInstance(2050, 1, 3),
            Date.newInstance(3050, 1, 1),
            new Recurring_Payment_Schedule__c(
                Run_of_Days_before_Collection_date__c = 1,
                cpm__Collection_Date_Conflict_Strategy__c = 'Next working day',
                cpm__Run_Date_Conflict_Strategy__c = 'Previous working day'
            ));
    }
}
