public abstract with sharing class RemoteActionSearchExtends {

    public Account account {get; set;}

    /**
     * Constructor
     */
    public RemoteActionSearchExtends() {
        this.account = new Account();
    }
    
    /**
     * Get Default AccountName
     */
    public String getAccountName() {
        return 'sforce';
    }
    
    /**
     * Get Accounts
     */
    @RemoteAction
    public static List<Account> getAccounts(String accountJSON) {
        System.debug(accountJSON);
        // Helper Class
        RemoteActionSearchHelper helper = new RemoteActionSearchHelper();
        // Dao Class
        RemoteActionSearchDao dao = new RemoteActionSearchDao();
        // Check JSON Stirng
        if (String.isEmpty(accountJSON)) return new List<Account>();
        
        // JSON → Map
        Map<String, Object> jsonMap = (Map<String, Object>) JSON.deserializeUntyped(accountJSON);
        // Get Account
        Account account = helper.getAccountJson(jsonMap);
       
        return dao.getAccounts(account);
    }
}