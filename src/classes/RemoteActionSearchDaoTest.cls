@isTest
private class RemoteActionSearchDaoTest {

    private static RemoteActionSearchDao dao = new RemoteActionSearchDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * Get Account
     */
    static testMethod void getAccountsTest1() {
    
        System.runAs(testAdminUser) {

            Account account = new Account();

            Test.startTest();

            List<Account> results = dao.getAccounts(account);

            Test.stopTest();
            
            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * Get Account
     */
    static testMethod void getAccountsTest2() {
    
        System.runAs(testAdminUser) {

            Account testAccount = new Account(Name = 'sforce', AccountNumber = '001');
            insert testAccount;

            Account account = new Account();
            account.Name = 'sforce';
            account.AccountNumber = '001';

            Test.startTest();

            List<Account> results = dao.getAccounts(account);

            Test.stopTest();
            
            System.assertEquals(results.size(), 1);
        }
    }
}