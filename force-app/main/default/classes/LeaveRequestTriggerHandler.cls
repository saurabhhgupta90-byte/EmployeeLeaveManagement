public class LeaveRequestTriggerHandler {

    public static void updateStatus(List<Leave_Request__c> leaveRequests){

        for(Leave_Request__c lr : leaveRequests){

            if(lr.Leave_Days__c <= 2){
                lr.Status__c = 'Approved';
            }
            else{
                lr.Status__c = 'Pending';
            }
        }
    }
}