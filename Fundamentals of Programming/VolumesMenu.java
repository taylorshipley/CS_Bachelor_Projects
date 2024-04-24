/***************************************************
* Author: Taylor Shipley
* Date: 03/21/2021
* Assignment: A07 Volumes
****************************************************/
import java.util.Scanner;

public class VolumesMenu
{
  public static void main (String[]args)
  {
      int selection;
      do
      {
   	   menuPrompt ();
   	   Scanner input = new Scanner (System.in);
   	   selection = input.nextInt ();
   	   if (selection < 0 || selection > 6)
      	{
      	  selection = 7;
      	}
      	switch (selection)
      	{
      	   case 1:
         	   System.out.printf ("cuboid(2, 4, 6): volume = %.1f%n", Volumes.cuboid (2, 4, 6));
         	   System.out.println ();
         	break;
      
         	case 2:
         	   System.out.printf ("cuboid(4): volume = %.1f%n", Volumes.cuboid (4));
         	   System.out.println ();
         	   break;
      
         	case 3:
         	   System.out.printf ("ellipsoid(2, 4, 6): volume = %.1f%n", Volumes.ellipsoid (2, 4, 6));
         	   System.out.println ();
         	   break;
      
         	case 4:
         	   System.out.printf ("ellipsoid(4): volume = %.1f%n", Volumes.ellipsoid (4));
         	   System.out.println ();
         	   break;
      
         	case 5:
         	   System.out.printf ("cylinder(3, 4): volume = %.1f%n", Volumes.cylinder (3, 4));
         	   System.out.println ();
         	   break;
      
         	case 6:
         	   System.out.printf ("cone(6, 5): volume = %.1f%n", Volumes.cone (6, 5));
         	   System.out.println ();
         	   break;
         	    
         	case 7:
         	   System.out.println ("Invalid input");
         	   System.out.println ();
         	   break;
      	    
         	case 0:
         	   System.out.println ("Good bye");
         	   System.out.println ();
      	      break;
         }
      }
    while (selection != 0);
  }

  public static void menuPrompt ()
  {
    System.out.printf ("%-25s %s%n",
		       "1 .. cuboid(2, 4, 6)", "2 .. cuboid(4)");
    System.out.printf ("%-25s %s%n",
		       "3 .. ellipsoid(2, 4, 6)", "4 .. ellipsoid(4)");
    System.out.printf ("%-25s %s%n", "5 .. cylinder(3,4)", "6 .. cone(6, 5)");
    System.out.println ("0 .. exit");
    System.out.print ("Your choice: ");
  }
}
