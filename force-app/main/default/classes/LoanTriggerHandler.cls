public class LoanTriggerHandler {

    public static void validateLoan(List<Loan_Application__c> loans){

        for(Loan_Application__c loan : loans){

            if(loan.Credit_Score__c >= 750){
                loan.Status__c = 'Approved';
            }
            else if(loan.Credit_Score__c >= 650){
                loan.Status__c = 'Submitted';
            }
            else{
                loan.Status__c = 'Rejected';
            }
        }
    }
}