trigger LeaveRequestTrigger on Leave_Request__c
(before insert, before update) {

    LeaveRequestTriggerHandler.updateStatus(Trigger.new);

}