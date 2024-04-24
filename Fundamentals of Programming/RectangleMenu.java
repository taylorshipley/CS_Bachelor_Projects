/*****************************************
 * Author : Taylor Shipley
 * Date : 03/16/2021
 * Assignment: Lab Rectangle Menu
 *******************************************/
import java.util.Scanner;
public class RectangleMenu
{
  public static void main (String[]args)
  {
    Rectangle rectangle = new Rectangle (5, 4);
    int selection;
    do
    { 
      menuPrompt();
      Scanner input = new Scanner(System.in);
      selection = input.nextInt();
      if (selection < 0 || selection > 3)
      {
         selection = 4;
      }
      	switch (selection)
      	{
      	   case 1:
      	    System.out.println();
      	    System.out.println ("Area: " + rectangle.area());
      	    System.out.println();
      	    break;
      	  case 2:
      	    System.out.println();
      	    System.out.println ("Perimeter: " + rectangle.perimeter());
      	    System.out.println();
      	    break;
      	  case 3:
      	    System.out.println();
      	    System.out.println ("Length: " + rectangle.getLength() + " Width: " + rectangle.getWidth());
      	    System.out.println();
      	    break;
      	  case 4:
      	    System.out.println();
      	    System.out.println ("Invalid input");
      	    System.out.println();
      	    break;
      	  case 0:
      	    System.out.println(); 
      	    System.out.println ("Good bye");
      	    break;  
      	} 
    }
	 while (selection != 0);
  }

   private static void menuPrompt()
	{
	  System.out.println ("1 .. area");
	  System.out.println ("2 .. perimeter");
	  System.out.println ("3 .. length and width");
	  System.out.println ("0 .. exit");
	  System.out.print ("Your choice: ");
	}
}
