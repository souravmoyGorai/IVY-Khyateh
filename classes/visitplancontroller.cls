public class visitplancontroller {

    @AuraEnabled
    public static list<wrapperclass> fetchVisits(string accountId, string contactId) {
        
        list<wrapperclass> wrapperclassList = new list<wrapperclass>();
        
        list<Account> storeList = [SELECT ID, Name, Parent_Branch__c, Seller_Name__c, Frequency__c, Seller_Name__r.Name, Visit_Plan__c 
                           FROM Account 
                           WHERE Parent_Branch__c =: accountId AND Seller_Name__c =: contactId];
        
        Contact conList = [SELECT ID, Name from Contact where ID =: contactId];
        
        for(Account tempStore : storeList) {
            wrapperclass newWrapClass;
            if(tempStore.Visit_Plan__c != null) {
                Visit_Plan__c vpList = [SELECT ID, Frequency__c, Sunday__c, Monday__c, Tuesday__c, Wednesday__c, Thursday__c, Friday__c, Saturday__c, WK1__c, WK2__c, WK3__c, WK4__c, WK5__c, Seller_Name__c, Seller_Name__r.Name 
                                        FROM Visit_Plan__c 
                                        WHERE ID =: tempStore.Visit_Plan__c];
                
                newWrapClass = new wrapperclass(tempStore.ID, tempStore.Name, conList.ID, conList.Name, vpList.Frequency__c, vpList.Monday__c, vpList.Tuesday__c, vpList.Wednesday__c, vpList.Thursday__c, vpList.Friday__c, vpList.Saturday__c,
                                                  vpList.Sunday__c, vpList.WK1__c, vpList.WK2__c, vpList.WK3__c, vpList.WK4__c, vpList.WK5__c, vpList.Id);
            }
            else {
                newWrapClass = new wrapperclass(tempStore.ID, tempStore.Name, conList.ID, conList.Name, tempStore.Frequency__c, false, false, false, false, false, false, false, false, false, false, false, false, '');
            }
            wrapperclassList.add(newWrapClass);
        }
        return wrapperclassList;
    }
    
    @AuraEnabled
    public static list <Visit_Plan__c> fetchAllVisits(string accountId) {
        list<Account> accountList = [SELECT ID, Name, Visit_Plan__c FROM Account WHERE ID =: accountId];
        list<ID> visitPlanIDList = new list<ID>();
        for(Account tempAcc : accountList) {
            visitPlanIDList.add(tempAcc.Visit_Plan__c);
        }
        list<Visit_Plan__c> allVisitPlansList = [SELECT ID, Name, Accounts__c, Thursday__c, Frequency__c,
                                                 WK1__c, WK2__c, WK3__c, WK4__c, WK5__c, Sunday__c, Saturday__c,
                                                 Friday__c, Wednesday__c, Accounts__r.name, Seller_Name__c,
                                                 Seller_Name__r.Name, Monday__c, Tuesday__c
                                                 FROM Visit_Plan__c WHERE ID IN: visitPlanIDList];
        return allVisitPlansList;
    }

    @AuraEnabled
    public static id savevisitplan(string wcs) {
        string idd = NULL;
        system.debug('########'+wcs);
        if (wcs != NULL) {
            list < wrapperclass > wrapperclassList = (list < wrapperclass > ) System.JSON.deserialize(wcs, list < wrapperclass >.class);
            list < Visit_Plan__c > vpUpsertList = new list < Visit_Plan__c > ();
            list<Account> accList = [SELECT ID, Visit_Plan__c 
                                     FROM Account];
            list<Account> accountToUpdate = new list<Account>();
            
            for (wrapperclass wc: wrapperclassList) {
                
                system.debug(wc.vpid.length());
                Visit_Plan__c vp = new Visit_Plan__c();
                vp.name = wc.accName + 'Plan ' + Date.Today().format();
                vp.Accounts__c = wc.accID;
                vp.Seller_Name__c = wc.conID;
                vp.Monday__c = wc.mon;
                vp.Tuesday__c = wc.tue;
                vp.Wednesday__c = wc.wed;
                vp.Thursday__c = wc.thur;
                vp.Friday__c = wc.fri;
                vp.Saturday__c = wc.sat;
                vp.Sunday__c = wc.sun;
                vp.WK1__c = wc.week1;
                vp.WK2__c = wc.week2;
                vp.WK3__c = wc.week3;
                vp.WK4__c = wc.week4;
                vp.WK5__c = wc.week5;
                if(wc.vpid.length() > 0) {
                    vp.id = wc.vpid;
                }
                vpUpsertList.add(vp);
            }

            upsert vpUpsertList;
            idd = vpUpsertList[0].id;
            
            for(wrapperclass wc: wrapperclassList) {
                for(Account tempAcc : accList) {
                    if(tempAcc.ID == wc.accID) {
                        for(Visit_Plan__c tempVC : vpUpsertList) {
                            if(tempVC.Accounts__c == wc.accID && tempVC.Seller_Name__c == wc.conID) {
                                tempAcc.Visit_Plan__c = tempVC.ID;
                                accountToUpdate.add(tempAcc);
                            }
                        }
                    }
                }
            }
            system.debug('££££'+accountToUpdate);
            update accountToUpdate;

        }
        return idd;
    }

    public class wrapperclass {
        
        @AuraEnabled
        public string accID {
            get;
            set;
        }
        
        @AuraEnabled
        public string accName {
            get;
            set;
        }
        
        @AuraEnabled
        public string conID {
            get;
            set;
        }
        
        @AuraEnabled
        public string conName {
            get;
            set;
        }

        @AuraEnabled
        public string frequency {
            get;
            set;
        }

        @AuraEnabled
        public boolean mon {
            get;
            set;
        }

        @AuraEnabled
        public boolean tue {
            get;
            set;
        }

        @AuraEnabled
        public boolean wed {
            get;
            set;
        }

        @AuraEnabled
        public boolean thur {
            get;
            set;
        }

        @AuraEnabled
        public boolean fri {
            get;
            set;
        }

        @AuraEnabled
        public boolean sat {
            get;
            set;
        }

        @AuraEnabled
        public boolean sun {
            get;
            set;
        }

        @AuraEnabled
        public boolean week1 {
            get;
            set;
        }

        @AuraEnabled
        public boolean week2 {
            get;
            set;
        }

        @AuraEnabled
        public boolean week3 {
            get;
            set;
        }

        @AuraEnabled
        public boolean week4 {
            get;
            set;
        }

        @AuraEnabled
        public boolean week5 {
            get;
            set;
        }

        @AuraEnabled
        public string vpid {
            get;
            set;
        }

        public wrapperclass(String accID, String accName, String conID, string con, string freq, boolean mon, boolean tue, boolean wed, boolean thur, boolean fri, boolean sat, boolean sun, boolean week1, boolean week2, boolean week3, boolean week4, boolean week5, string vpid) {
            this.accID = accID;
            this.accName = accName;
            this.conID = conID;
            this.conName = con;
            this.frequency = freq;
            this.mon = mon;
            this.tue = tue;
            this.wed = wed;
            this.thur = thur;
            this.fri = fri;
            this.sat = sat;
            this.sun = sun;
            this.week1 = week1;
            this.week2 = week2;
            this.week3 = week3;
            this.week4 = week4;
            this.week5 = week5;
            this.vpid = vpid;
        }

    }

}