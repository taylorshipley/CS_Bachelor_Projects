package week6;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

public class ReadDelimited 
{
	static int newPlayerID = 10000;
	static PlayerNode next;
	static int playerID;
	static String firstName;
	static String lastName;
	static String playerName;
	static PlayerType playerType;
	static double lifePoints;
	static int totalScore;
  public static void main(String[] args) 
  {
    PlayerLinkedList ll = new PlayerLinkedList();
    Scanner sc = null;
    try 
    {
      sc = new Scanner(new File("/Users/tays012/Documents/PlayersCopy.csv"));

      // Check if there is another line of input
      while(sc.hasNextLine())
      {
        String str = sc.nextLine();
        // parse each line using delimiter
        parseData(str);
        ll.append(next, playerID, firstName, lastName, playerName, playerType, lifePoints, totalScore);
      }
    } catch (IOException  exp) 
    {
      exp.printStackTrace();
    }
    finally
    {
      if(sc != null)
        sc.close();
    }
    Scanner input = new Scanner(System.in);
    int choice;
    do
    {
        System.out.println("Player Linked List Main Menu\n");
        System.out.println("1.) Add Player \n");
        System.out.println("2.) Delete Player.\n");
        System.out.println("3.) Player Count.\n");
        System.out.println("4.) Display All Players.\n");
        System.out.println("5.) Search by Player ID.\n");
        System.out.println("6.) Search by Player's Real Name.\n");
        System.out.println("7.) Search by Player's Game Name.\n");
        System.out.println("8.) Report Player with Highest Total Score.\n");
        System.out.println("9.) Report Player with Lowest Total Score.\n");
        System.out.println("0.) Exit\n");
        System.out.println("\nEnter Your Menu Choice: ");
        choice = input.nextInt();
        input.nextLine();
        
	    switch(choice)
	    {
		    case 1:
		    	System.out.println("Enter First Name: ");
		    	firstName = input.nextLine();
		    	
		    	System.out.println("Enter Last Name: ");
		    	lastName = input.nextLine();
		    	
		    	System.out.println("Enter Player's Game Name: ");
		    	playerName = input.nextLine();
		    	
		    	System.out.println("Enter Player Type: ");
		    	playerType = PlayerType.valueOf(input.nextLine());
		    	
		    	System.out.println("Enter Life Points: ");
		    	lifePoints = input.nextDouble();
		    	input.nextLine();
		    	
		    	System.out.println("Enter Total Score: ");
		    	totalScore = input.nextInt();
		    	input.nextLine();
		    	
		    	ll.append(next, newPlayerID, firstName, lastName, playerName, playerType, lifePoints, totalScore);
		    	newPlayerID++;
		        break;
		
		    case 2: 
		    	System.out.println("Enter Player ID to be deleted: ");
		    	int deletedPlayerID = input.nextInt();
		    	ll.delete(deletedPlayerID);
		        break;
		
		    case 3:
		        System.out.println("Total Number of Players: " + ll.length());
		        break;
		
		    case 4: 
		    	ll.printPlayerList();
		        break;
		
		    case 5:
		    	System.out.println("Enter Player ID to be searched: ");
		    	int searchPlayerID = input.nextInt();
		    	System.out.println(ll.search(searchPlayerID));
		        break;
		    case 6:
		    	System.out.println("Enter Player's First: ");
		    	String searchPlayerFName = input.nextLine();
		    	System.out.println("Enter Player's Last Name: ");
		    	String searchPlayerLName = input.nextLine();
		    	System.out.println(ll.search(searchPlayerFName,searchPlayerLName));
		        break;
		    case 7:
		    	System.out.println("Enter Player's Game Name to be searched: ");
		    	String searchPlayerGName = input.nextLine();
		    	System.out.println(ll.search(searchPlayerGName));
		        break;
		    case 8:
		    	System.out.println(ll.highScore());
		        break;
		    case 9:
		    	System.out.println(ll.lowScore());
		        break;
		
		    case 0: 
		        System.out.println("Exiting Program...");
		        System.exit(0);
		         break;
		    default:
		    System.out.println(choice + " is not a valid Menu Option! Please Select Another.");
	    }
	}while(choice != 0); /*Exit loop when choice is 6*/
    input.close();
  }
  private static void parseData(String str)
  {  
    Scanner lineScanner = new Scanner(str);
    lineScanner.useDelimiter(",");
    while(lineScanner.hasNext())
    {
      playerID = Integer.parseInt(lineScanner.next());
      firstName = lineScanner.next();
      lastName = lineScanner.next();
      playerName = lineScanner.next();
      playerType = PlayerType.valueOf(lineScanner.next());
      lifePoints = Double.parseDouble(lineScanner.next());
      totalScore = Integer.parseInt(lineScanner.next()); 
    }
    lineScanner.close();
  }
}
