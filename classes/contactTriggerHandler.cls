/**********************************************************************
    @ Apex Class  : contactTriggerHandler
    @ Description : This class is used to handle all the logics of the contactTrigger.
    @ Created Date: December 15, 2016
    @ Author      : Souravmoy Gorai            
***********************************************************************/

public with sharing class contactTriggerHandler {
    
    /*************************************************
    Method Name    : updateContactsOnContactInsert
    Description    : On creating a new Contact, it automatically creates a new User with the same details
    				 and links the usere with the contact
    Input Parameter: Trigger.new
    *************************************************/
    public static void updateContactsOnContactInsert(list<Contact> newContactList) {
    	
    	list<User> newUserList = new list<User>();
    	Profile userProfile = [select Name from Profile where Name = 'Standard Platform User'];
    	
    	for(Contact tempContact : newContactList) {
    		// Its mandatory to add email for Contact
    		if(tempContact.Email == '' || tempContact.Email == null)
    			tempContact.addError('Email field cannot be blank');
    		
    		try {
	    		User newUser = new User();
	    		newUser.Title		= tempContact.Title;
	    		newUser.FirstName	= tempContact.FirstName;
	    		newUser.LastName	= tempContact.LastName;
	    		newUser.Alias		= tempContact.FirstName.substring(0,4) + tempContact.LastName.substring(0,4);
	    		newUser.Email		= tempContact.Email;
	    		newUser.Phone		= tempContact.Phone;
	    		newUser.MobilePhone	= tempContact.MobilePhone;
	    		newUser.Username	= tempContact.FirstName + '.' + tempContact.LastName + '@ivymobility.com';
	    		newUser.profileid	= userProfile.ID;
	    		newUser.CommunityNickname	= tempContact.FirstName + tempContact.LastName; 
	    		newUser.emailencodingkey	= 'UTF-8';
	    		newUser.languagelocalekey	= 'en_US';
	    		newUser.localesidkey		= 'en_US';
	    		newUser.timezonesidkey		= 'America/Los_Angeles';
	    		
	    		newUserList.add(newUser);
    		}
    		catch(Exception e) {
    			tempContact.addError('An unexpected error occured: '+e.getMessage());
    		}
    	}
    	Database.insert(newUserList);			// Insert Standard Platform User for the new Contact
    	
    	for(Contact tempContact : newContactList) {
    		for(User tempUser : newUserList) {
    			if(tempUser.Email == tempContact.Email) {
    				tempContact.Related_User__c = tempUser.ID;
    			}
    		}
    	}
    }
}