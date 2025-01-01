
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        
       Scanner scanner = new Scanner(System.in);

       // Create a new account
       System.out.print("Enter customer name: ");
       String name = scanner.nextLine();

       System.out.print("Enter initial deposit: ");
       double balance = scanner.nextDouble();

       bankAccount account = new bankAccount(name, balance);

       // choices
       int choice = 0;
       while (choice != 4) {
           System.out.println("--- Choose ---");
           System.out.println("1. Display Account Details");
           System.out.println("2. Deposit Money");
           System.out.println("3. Withdraw Money");
           System.out.println("4. Exit");
           System.out.print("Enter your choice: ");
           choice = scanner.nextInt();

           switch (choice) {
               case 1:
                   account.displayBankAccount();
                   break;
               case 2:
                   System.out.print("Enter deposit amount: ");
                   double depositAmount = scanner.nextDouble();
                   account.deposit(depositAmount);
                   break;
               case 3:
                   System.out.print("Enter withdrawal amount: ");
                   double withdrawalAmount = scanner.nextDouble();
                   account.withdraw(withdrawalAmount);
                   break;
               case 4:
                   System.out.println("Exit program");
                   break;
               default:
                   System.out.println("Invalid choice. Please try again.");
           }
       }

        
    }}