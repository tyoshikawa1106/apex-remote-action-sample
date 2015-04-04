@isTest
private class RemoteActionSearchHelperTest {

    private static RemoteActionSearchHelper helper = new RemoteActionSearchHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * getAccountJsonTest1
     */
    static testMethod void getAccountJsonTest1() {
    
        System.runAs(testAdminUser) {

            Map<String, Object> jsonMap = new Map<String, Object>();

            Test.startTest();

            Account result = helper.getAccountJson(jsonMap);

            Test.stopTest();
            
            System.assertEquals(String.isEmpty(result.Name), true);
            System.assertEquals(String.isEmpty(result.AccountNumber), true);
        }
    }

    /**
     * getAccountJsonTest2
     */
    static testMethod void getAccountJsonTest2() {
    
        System.runAs(testAdminUser) {

            Map<String, Object> jsonMap = new Map<String, Object>();
            jsonMap.put('Name', 'sforce');
            jsonMap.put('AccountNumber', '001');

            Test.startTest();

            Account result = helper.getAccountJson(jsonMap);

            Test.stopTest();
            
            System.assertEquals(String.isNotEmpty(result.Name), true);
            System.assertEquals(result.Name, 'sforce');
            System.assertEquals(String.isNotEmpty(result.AccountNumber), true);
            System.assertEquals(result.AccountNumber, '001');
        }
    }
}