public class MonitorMe implements TxnSecurity.PolicyCondition {

    /** Purpose of MonitorMe:
     * If you're the system admin, this method will allow this policy to be ran on you
     * if you're not a system admin, it will ignore you (so if you sign in as someone else, you won't get an email, etc)
     */ 
     
    public boolean evaluate(TxnSecurity.Event e) {  

        //Plumbing done to track yourself, the System Admin
        List<User> ourUser = [Select Id, ProfileId from User where Id = :e.UserId];
	String objUsersProfile = ourUser[0].ProfileId;
        List<Profile> ourProfile = [Select Id, Name from Profile where Name ='System Administrator' limit 1];
	String sysAdmin = ourProfile[0].Id;
        
	//If you're the system admin, then you'll get an email. If not, you won't.
        if(objUsersProfile == sysAdmin){
                return true;
            }
                return false;
	}
}
