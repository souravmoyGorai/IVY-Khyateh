/*************************************************************************\
    @ Author        : Souravmoy Gorai
    @ Date          : December 15, 2016
    @ Handler       : contactTriggerHandler
    @ Test File     : TestContactTrigger
    @ Function      : Before Insert operations
    @ Audit Trial   : Repeating block for each change to the code
    -----------------------------------------------------------------------------
    
******************************************************************************/
trigger contactTrigger on Contact (before insert) {
    
    // Before Insert Triggers
    if(trigger.isInsert && trigger.isBefore) {
    	contactTriggerHandler.updateContactsOnContactInsert(trigger.new);
    }
}