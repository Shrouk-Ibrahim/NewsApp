package question1;

public class bankAccount {
    private String customerName;
    private double accountBalance;
    private static int accountNumber =0; //


    // Constructor
    public bankAccount(String customerName, double initialBalance) {
        this.customerName = customerName;
        this.accountBalance = initialBalance;
        this.accountNumber ++;
        displayBankAccount();
    }

    // Getters and Setters
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public double getAccountBalance() {
        return accountBalance;
    }

    public void setAccountBalance(double accountBalance) {
        this.accountBalance = accountBalance;
    }

    public int getAccountNumber() {
        return accountNumber;
    }

    // Display Account Details
    public void displayBankAccount() {
        System.out.println(" Account Details");
        System.out.println("Customer Name: " + customerName);
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Account Balance: $"+ accountBalance);
    }

    // Deposit Method
    public void deposit(double money) {
        if (money > 0) {
            accountBalance += money;

        } else {
            System.out.println("Deposit amount must be positive");
        }
    }

    // Withdraw Method
    public void withdraw(double money) {
        if (money > 0 && money <= accountBalance) {
            accountBalance -= money;
            System.out.println("withdraw $"+money+ "New Balance:$"+  accountBalance);
        } else if (money > accountBalance) {
            System.out.println("Not enough money");
        } else {
            System.out.println("Withdraw amount must be positive");
        }
    }

}