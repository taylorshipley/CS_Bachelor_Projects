/*****************************************
 * Author : Taylor Shipley
 * Date : 05/03/2021
 * Assignment: Final Project
 *******************************************/
import java.util.Scanner;
import java.util.ArrayList;
public class OrderPizza
{
	public static void main(String[] args) 
	{
	   double total = 0;
		System.out.println("Welcome to Java's Pizza!");
		final String[] mainMenu = {"(1) $2.50 Garlic Bread ", "(2) $4.00 Small Pizza", "(3) $5.50 Regular Pizza", "(4) $6.25 Large Pizza", "(5) $2.00 Soda"};
		final double[] mainMenuPrices = {2.50, 4.00, 5.50, 6.25, 2.00};
		final String[] pizzaMenu = {"(1) Cheese Pizza", "(2) Pepperoni Pizza", "(3) Combo Pizza"};
		final String[] sodaMenu = {"(1) Coke", "(2) Diet Coke", "(3) Root Beer", "(4) Sprite", "(5) Grape Soda"};
		int selection;
		int selection2;
		String pizzaType;
		ArrayList<String> reciept = new ArrayList<String>();
		Scanner input = new Scanner(System.in);
		do
		{
   		for (String m: mainMenu)
   		{
   		   System.out.println(m);
   		}
   		System.out.println("\nEnter menu number order item and 0 when finished ordering");
   	   selection = input.nextInt();
   	   input.nextLine();
         if (selection < 0 || selection > 5)
         {
            selection = 6;
         }
         int itemNum = selection - 1;
      	switch (selection)
      	{
      	  case 1:
      	      reciept.add(mainMenu[itemNum]);
      	      System.out.println("Added " + mainMenu[itemNum]);
      	      System.out.println();
      	      total += mainMenuPrices[itemNum];
      	      break;
      	  case 2:
      	      do
   		      {
         	      for (String m: pizzaMenu)
      		      {
      		         System.out.println(m);
      		      }
      		      selection2 = input.nextInt();
      		      input.nextLine();
      		      if (selection2 < 1 || selection2 > 3)
      		      {
      		         selection2 = 4;
      		      }
      		      switch (selection2)
      		      {
      		         case 1:
      		            reciept.add(pizzaMenu[selection2 - 1]);
      		         case 2:
      		            reciept.add(pizzaMenu[selection2 - 1]);
      		         case 3:
      		            reciept.add(pizzaMenu[selection2 - 1]);
      		         case 4:
         	            System.out.println ("Invalid input");
         	            System.out.println();
         	            break;
      		      }
   		      }
   		      while (selection2 == 4);
      	      System.out.println ("Added " + pizzaMenu[selection2 - 1]);
      	      System.out.println();
      	      total += mainMenuPrices[itemNum];
      	      break;
      	  case 3:
      	      do
      	      {
         	      for (String m: pizzaMenu)
      		      {
      		         System.out.println(m);
      		      }
      		      selection2 = input.nextInt();
      		      input.nextLine();
      		      if (selection2 < 1 || selection2 > 3)
      		      {
      		         selection2 = 4;
      		      }
      		      switch (selection2)
      		      {
      		         case 1:
      		            reciept.add(pizzaMenu[selection2 - 1]);
      		         case 2:
      		            reciept.add(pizzaMenu[selection2 - 1]);
      		         case 3:
      		            reciept.add(pizzaMenu[selection2 - 1]);
      		         case 4:
         	            System.out.println ("Invalid input");
         	            System.out.println();
         	            break;
      		      }
      	      }
      	      while (selection2 == 4);
      	      System.out.println ("Added " + pizzaMenu[selection2 - 1]);
      	      System.out.println();
      	      total += mainMenuPrices[itemNum];
      	      break;
      	  case 4:
      	     do
      	      {
         	      for (String m: pizzaMenu)
      		      {
      		         System.out.println(m);
      		      }
      		      selection2 = input.nextInt();
      		      input.nextLine();
      		      if (selection2 < 1 || selection2 > 3)
      		      {
      		         selection2 = 4;
      		      }
      		      switch (selection2)
      		      {
      		         case 1:
      		            reciept.add(pizzaMenu[selection2 - 1]);
      		         case 2:
      		            reciept.add(pizzaMenu[selection2 - 1]);
      		         case 3:
      		            reciept.add(pizzaMenu[selection2 - 1]);
      		         case 4:
         	            System.out.println ("Invalid input");
         	            System.out.println();
         	            break;
      		      }
      	      }
      	      while (selection2 == 4);
      	      System.out.println ("Added " + pizzaMenu[selection2 - 1]);
      	      System.out.println();
      	      total += mainMenuPrices[itemNum];
      	      break;
      	  case 5:
      	      do
      	      {
         	      for (String m: sodaMenu)
      		      {
      		         System.out.println(m);
      		      }
      		      selection2 = input.nextInt();
      		      input.nextLine();
      		      if (selection2 < 1 || selection2 > 5)
      		      {
      		         selection2 = 6;
      		      }
      		      switch (selection2)
      		      {
      		         case 1:
      		            reciept.add(sodaMenu[selection2 - 1]);
      		            break;
      		         case 2:
      		            reciept.add(sodaMenu[selection2 - 1]);
      		            break;
      		         case 3:
      		            reciept.add(sodaMenu[selection2 - 1]);
      		            break;
      		         case 4:
      		            reciept.add(sodaMenu[selection2 - 1]);
      		            break;
      		         case 5:
      		            reciept.add(sodaMenu[selection2 - 1]);
      		            break;
      		         case 6:
         	            System.out.println ("Invalid input");
         	            System.out.println();
         	            break;
      		      }
      	      }
      	      while (selection2 == 6);
      	      System.out.println ("Added " + sodaMenu[selection2 - 1]);
      	      total += mainMenuPrices[itemNum];
      	      break;
      	  case 6:
      	      System.out.println ("Invalid input");
      	      System.out.println();
      	      break;
      	  case 0:
      	      System.out.println();
      	      System.out.println("Items Ordered:");
      	      for (int j = 0; j < reciept.size(); j++)
      	      {
      	         System.out.println(reciept.get(j));
      	      }
      	      System.out.println("-------------------------------");
      	      System.out.printf("Total: $%.2f\n", total);
      	      break;  
         }
		} while (selection != 0);
	}
}