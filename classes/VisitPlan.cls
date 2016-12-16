public with sharing class VisitPlan{
 
 public Visit_Plan__c vp{get; set;}
 public List<Visit_Plan__c> newVPList{get; set;}

    public VisitPlan(ApexPages.StandardController stdController){
        vp = new Visit_Plan__c();
    }
    
    public void fetchVP(){
        try{
            newVPList = new List<Visit_Plan__c>();
            Visit_Plan__c tempVP;
            Set<ID> ConID=new Set<ID>();
            List<Contact> lstCon= [select id,name from Contact where AccountID =: vp.Account__c];
            System.debug(lstCon);
            If(lstCon != NULL){
            for(Contact c: lstCon){
            conID.add(c.id);
            }
            List<Account> lstAcc = [Select Id, Name,Parent_Branch__c from Account where Seller_Name__c =:conID and Seller_Name__c =:vp.Seller_Name__c ];
            for(Account a: lstAcc){
                tempVP = new Visit_Plan__c();
                tempVP.Seller_Name__c = vp.Seller_Name__c;
                tempVP.Accounts__c = a.id; 
                //tempVP.Account__c = a.Parent_Branch__c;
                tempVP.Name = a.Name + 'Plan ' + Date.Today().format();  
                
                newVPList.add(tempVP);                
            }
            }
            else{
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'ConTactList Empty'));
           } 
            
        }catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,e.getMessage()));
            
        }
     }
     
     public PageReference saveVP(){
         try{
            System.Debug(newVPList);
            insert newVPList; 
            String id = ApexPages.CurrentPage().getparameters().get('id');
            string urlId = label.VisitPlanId;
            pagereference ref = new pageReference('/'+urlId);
            return ref;
                               
        }catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,e.getMessage()));
            return null;
            
        }

    }     
 
 }