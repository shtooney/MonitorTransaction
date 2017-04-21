// This is a quick code snippet that can be found in a Controller behind a VF page
// It shows 2 examples: one that doesn't work because data interraction is at DB-level while other works because it's in app server
public class MyCodeInVFcontrollerExample {

    public static void sortMyData(){
        
        /**
         * ~~~~~~~~EXAMPLE 1: Example that doesn't work~~~~~~~~
         * Line below = Example that results in an error BECAUSE it's pulled from DB with encryption on name 
         * List<Contact> myContacts = [SELECT Id FROM Contact ORDER BY NAME ASC];
         * You get an "Error: Compile Error: encrypted field 'NAME' cannot be ordered in a query call at line..." 
         */
        
        /**
         * ~~~~~~~~EXAMPLE 2: Example that does work~~~~~~~~
         */
        
        // This line moves Contacts from DB tier into App Server tier, which means you can do processing now
        List<Contact> myContacts = new List<Contact>{[SELECT Id, Name FROM Contact]};
        
        //This sorts contacts by default ascending sort order because it's now in a list in an app server
        myContacts.sort();
        //FYI: Sort order doc for reference: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_list_sorting_sobject.htm
        
    }
    
}
