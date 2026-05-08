public class Test {
    void m(Set<String> values) {
        builder
            .addRule(
                new RuleBuilder('FieldA')
                    .stepOne(null, 'FieldC', values)
                    .stepTwo()
                    .stepThree(new Set<String> {'ValueA'})
                    .stepFour(null, 'FieldB', SomeOperator.EQUALS, null, 'Choose either A or B.')
                    .build()
            )
            .addRule(
                new RuleBuilder('FieldB')
                    .stepOne(null, 'FieldC', values)
                    .stepTwo()
                    .stepThree(new Set<String> {'ValueA'})
                    .stepFour(null, 'FieldA', SomeOperator.EQUALS, null, 'Choose either A or B.')
                    .build()
            );
    }
}
