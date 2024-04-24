/*******************************************************
* Name: Taylor Shipley
* Assignment: A02
*******************************************************/
import java.util.Scanner;
public class Main
{
  public static void main (String[]args)
  {
    //int change = 0;   Ask Tim about how to redefine int
    int quarters = 0;
    int dimes = 0;
    int nickels = 0;
    int pennies = 0;
    String exitPrgm = "";
    Scanner input = new Scanner (System.in);
    System.out.println ("Please Enter Amount of Change (1-99) or ZERO to EXIT.");
    String totalMoney = input.nextLine ();
    
    while ( exitPrgm != "ZERO")
    {
        //if (totalMoney.equals (exitPrgm))
        //{
	    //System.exit (0);	//ends program if input is ZERO
        //}
        int change = Integer.parseInt (totalMoney);	//converts string to integer
    
        while (change > 0)    
    	{
    	  while (change >= 25)
    	  {
    	    change = (change - 25);
	        quarters++;
    	  }
    	  while (change >=10)
    	  {
    	    change = (change - 10);
    	    dimes++;
    	  }
    	  while (change >= 5)
    	  {
    	    change = (change - 5);
    	    nickels++;
    	  }
    	  pennies = change;
    	  change  = 0;
    	}
	    
	    System.out.println("Quarters = " + quarters);
	    System.out.println("Dimes = " + dimes);
	    System.out.println("Nickles = " + nickels);
	    System.out.println("Pennies = " + pennies);
	    quarters = 0;
	    dimes = 0;
	    nickels = 0;
	    pennies = 0;
	    System.out.println ("Please Enter Amount of Change (1-99) or ZERO to EXIT.");
        totalMoney = input.nextLine ();
        if (totalMoney.equals("ZERO"))
        {
            System.exit (0);	//ends program if input is ZERO  
        }
    }    
    
  }
}
