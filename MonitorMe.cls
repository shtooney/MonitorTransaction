public class MonitorMe implements TxnSecurity.PolicyCondition {

//Plumbing done to track yourself, the System Admin
List<User> ourUser = [Select Id, ProfileId from User where Id=: UserInfo.getUserId()];
String objUser = ourUser[0].ProfileId;
List<Profile> ourProfile = [Select Id, Name from Profile where Name ='System Administrator' limit 1];
String objProfile = ourProfile[0].Id;
    
    public boolean evaluate(TxnSecurity.Event e) {  
		//if you're the system admin, then you'll get an email
        if(objUser == objProfile){
            return true;
        }
        	return false;
        }
}
