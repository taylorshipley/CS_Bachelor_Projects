/*****************************************
 * Author : Taylor Shipley
 * Date : 02/17/2021
 * Midterm: Account Test
 *******************************************/
 public class AccountTest
{
   public static void main(String[] args) 
   {
      Account myAccount = new Account(75);
      System.out.printf("Initial balance in myAccount = $%d%n", myAccount.getBalance()); 
      myAccount.debit(20);
      System.out.printf("Balance in myAccount after a withdrawal = $%d%n", myAccount.getBalance());
      myAccount.debit(15);
      System.out.printf("Balance in myAccount after a withdrawal = $%d%n", myAccount.getBalance());
      myAccount.credit(50);
      System.out.printf("Balance in myAccount after a deposit = $%d%n", myAccount.getBalance());
      myAccount.debit(25);
      System.out.printf("Balance in myAccount after a withdrawal = $%d%n", myAccount.getBalance());
      
      System.out.println();
      Account dadsAccount = new Account(5000);
      System.out.printf("Initial balance in dadsAccount = $%d%n", dadsAccount.getBalance()); 
      dadsAccount.credit(2000);
      System.out.printf("Balance in dadsAccount after a withdrawal = $%d%n", dadsAccount.getBalance());
      dadsAccount.debit(5000);
      System.out.printf("Balance in dadsAccount after a withdrawal = $%d%n", dadsAccount.getBalance());
   }
}