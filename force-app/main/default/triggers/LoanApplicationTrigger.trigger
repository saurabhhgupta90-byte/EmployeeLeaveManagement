trigger LoanApplicationTrigger on Loan_Application__c (
    before insert,
    before update
) {
    LoanTriggerHandler.validateLoan(Trigger.new);
}