/*****************************************
 * Author : Taylor Shipley
 * Date : 02/17/2021
 * Midterm: Account
 *******************************************/
 public class Account
{
   private int currentBalance;
	
   public Account(int startBalance)
   {
      currentBalance = startBalance;
   }
   
   public int getBalance() 
   {
      return currentBalance;
   }

   public void credit(int creditAmount) 
   {
      currentBalance += creditAmount;
   }
   
   public void debit(int debitAmount) 
   {
         currentBalance -= debitAmount;
   }
}