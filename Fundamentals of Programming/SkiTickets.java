/*****************************************
 * Author : Taylor Shipley
 * Date : 01/24/2021
 * Assignment: A02 – Ski Tickets
 *******************************************/
import java.util.Scanner;

public class SkiTickets
{
    public static void main(String[] args) 
    {
      Scanner scanner = new Scanner(System.in);
		System.out.print("Number of adult tickets: ");
		int aTicket= scanner.nextInt();
		scanner.nextLine();
		System.out.print("Number of youth tickets: ");
		int yTicket= scanner.nextInt();
		scanner.nextLine();
		System.out.print("Name: ");
		String name= scanner.nextLine();
		System.out.println();
		System.out.println();
		
		double aCost= aTicket*93.00;
		double yCost= yTicket*47.00;
		double totalCost= aCost+yCost;
		
      String space="..";
      String spaces=" ";
      System.out.println("Invoice for " + name + ":");
      System.out.println();
      System.out.println();
      System.out.printf("Adult tickets %-4s %-2s $ %7.2f \n",aTicket, space, aCost);
      System.out.printf("Adult tickets %-4s %-2s $ %7.2f \n",yTicket, space, yCost,(aCost+yCost));
      System.out.println("-------------------------------");
      System.out.printf("%-21s $ %7.2f \n",spaces, totalCost);
      System.out.println("                      =========");
    }
}