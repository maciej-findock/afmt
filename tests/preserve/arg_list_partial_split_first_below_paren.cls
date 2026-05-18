public class A {
    void m() {
        return cpm.PaymentProfileService.findOrCreateCreditCardPaymentProfile(
            contactId,
            'XXXX-XXXX-XXXX-' + parameters.get('additionaldata.cardsummary'),
            expiryDate.get(0), expiryDate.get(1),
            otherFields);
    }
}
