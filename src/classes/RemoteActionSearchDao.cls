public with sharing class RemoteActionSearchDao {

    /**
     * Constructor
     */
    public RemoteActionSearchDao() {
        
    }

    /**
     * Get Account
     */
    public List<Account> getAccounts(Account account) {
        
        String accountName = account.Name + '%';
        String accountNumber = account.AccountNumber + '%';
    
        return [
            SELECT
                 Id
                ,Name
                ,AccountNumber
            FROM
                Account
            WHERE
                Name Like: accountName
            AND
                AccountNumber Like: accountNumber
            ORDER BY Name ASC
            LIMIT 200
        ];
    }
}