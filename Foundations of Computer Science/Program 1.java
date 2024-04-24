/*******************************************************
* Name: Taylor Shipley
* Assignment: A01
*******************************************************/
import java.util.Scanner;
public class Main
{
  public static void main (String[]args)
  {
    // part1
    System.out.print ("@..@");
    System.out.print ("(----)");
    System.out.print ("( >__< )");
    System.out.println ("^^ ~~ ^^");
    System.out.println(" ");
    //part2
    Scanner input = new Scanner (System.in);
      System.out.println ("What is your favorite state?");
    String state = input.nextLine ();	//reads user's input and stores it
      System.out.println ("What is the capital of " + state + "?");
    String capital = input.nextLine ();	//reads user's input and stores it
      System.out.println ("What is your name");
      System.out.printf ("The capital of %s is %s", state, capital);	//final output
  }
}
