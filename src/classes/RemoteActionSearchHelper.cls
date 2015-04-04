public with sharing class RemoteActionSearchHelper {

	/**
     * Constructor
     */
	public RemoteActionSearchHelper() {
		
	}

	/**
	 * Get Account
	 */
	public Account getAccountJson(Map<String, Object> jsonMap) {
        Account account = new Account();
        account.Name = (String)jsonMap .get('Name');
        account.AccountNumber = (String)jsonMap .get('AccountNumber');

        return account;
	}
}