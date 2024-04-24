import java.util.Scanner;

public class LabMarbles
{
   public static void main(String[] args)
   {
       Scanner in = new Scanner(System.in);
       System.out.print("Enter Color: ");
       String color1 = in.nextLine();
       System.out.print("Enter the number of " + color1 + " marbles: ");
       int number1= in.nextInt();
       in.nextLine();
       
       
       System.out.print("Enter Another Color: ");
       String color2 = in.nextLine();
       System.out.print("Enter the number of " + color2 + " marbles: ");
       int number2 = in.nextInt();
       in.nextLine();
       
       System.out.print("Enter Another Color: ");
       String color3 = in.nextLine();
       System.out.print("Enter the number of " + color3 + " marbles: ");
       int number3 = in.nextInt();
       in.nextLine();
       
       System.out.printf("%-12s %-12s\n", "Color", "Number of Marbles");
       System.out.printf("%-12s %-12s\n","------------", "-----------------");
       System.out.printf("%-12s %-12s\n", color1, number1);
       System.out.printf("%-12s %-12s\n", color2, number2);
       System.out.printf("%-12s %-12s\n", color3, number3);
   }
}