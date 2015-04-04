@isTest
private class RemoteActionSearchControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * RemoteActionSearchControllerTest1
     */
    static testMethod void RemoteActionSearchControllerTest1() {
    
        System.runAs(testAdminUser) {

            Test.startTest();

            RemoteActionSearchController cls = new RemoteActionSearchController();

            Test.stopTest();

            System.assertEquals(cls.account.Name, 'sforce');
        }
    }

    /**
     * getAccountsTest1
     */
    static testMethod void getAccountsTest1() {
    
        System.runAs(testAdminUser) {

            String accountJSON = '';

            Test.startTest();

            List<Account> results = RemoteActionSearchExtends.getAccounts(accountJSON);

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * getAccountsTest2
     */
    static testMethod void getAccountsTest2() {
    
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'United Oil & Gas, UK', AccountNumber = 'CD355119');
            insert account;

            String accountJSON = '{"Name":"United Oil","AccountNumber":"CD"}';

            Test.startTest();
            
            List<Account> results = RemoteActionSearchExtends.getAccounts(accountJSON);

            Test.stopTest();

            System.assertEquals(results.size(), 1);
        }
    }
}