import java.util.Scanner;

public class Main
{
   public static void main(String args[])
   {
      Scanner input = new Scanner(System.in);
      System.out.println("Enter a number");
      int num1 = input.nextInt();
      boolean[] prime = new boolean[num1];
     
      for (int i = 0; i< prime.length; i++)
      {
         prime[i] = true;
      }
      for (int i = 2; i< Math.sqrt(num1); i++)
      {
         if(prime[i] == true)
         {
            for(int j = (i*i); j<num1; j = j+i)
            {
               prime[j] = false;
            }
         }
      }
      System.out.println("List of prime numbers up to " + num1 + " are : ");
      for (int i = 2; i< prime.length; i++) {
         if(prime[i]==true) {
            System.out.println(i);
         }
      }
   }
}
