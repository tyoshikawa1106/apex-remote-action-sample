public with sharing class RemoteActionSearchController extends RemoteActionSearchExtends {
    
    /**
     * Constructor
     */
    public RemoteActionSearchController() {
        // Get Default Value
        this.account.Name = this.getAccountName();
    }
}