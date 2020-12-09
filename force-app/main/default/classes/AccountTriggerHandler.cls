public class AccountTriggerHandler {
    public static void createAccounts(List<Account> accounts) {
        for (Account acc_i : accounts) {
            if (acc_i.ShippingState != acc_i.BillingState) {
                acc_i.ShippingState = acc_i.BillingState;  
            }
        }
    }
}