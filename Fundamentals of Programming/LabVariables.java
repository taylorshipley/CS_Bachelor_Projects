import java.util.Scanner;
class Main
{
  public static void main (String[]args)
  {
    Scanner input = new Scanner (System.in);
    System.out.print ("Please enter your favorite destination.\t");
    String destination = input.nextLine();
      System.out.printf ("Welcome to %s",destination);
      int kingsPeak = 4124;
      int timpanogos = 3581;
      
      System.out.printf ("%nElevation of Kings Peak: %d ft",kingsPeak);
      System.out.printf ("%nElevation of Timpanogos: %d ft",timpanogos);
  }
}
