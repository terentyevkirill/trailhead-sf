@isTest
public class AccountTriggerTest {	
    @isTest
    static void test() {
        List<Account> accs = new List<Account>();
        for(Integer i = 0; i < 200; i++) {
            Account acc = new Account();
            acc.Name = 'test-' + (i + 1);
            acc.BillingState = 'CA';
            accs.add(acc);
        }
        Test.startTest();
        insert accs;
        Test.stopTest();
        Set<Id> insertedIds = new Set<Id>();
        for (Account acc_i : accs) {
            insertedIds.add(acc_i.Id);
        }
        List<Account> accsAfter = [
            SELECT Id
            	, Name
            	, BillingState
            	, ShippingState
            FROM Account
            WHERE
            	Id IN :insertedIds
        ];	
        for (Account acc_i : accsAfter) {
            System.assert(acc_i.ShippingState == acc_i.BillingState);
        }
    }
}