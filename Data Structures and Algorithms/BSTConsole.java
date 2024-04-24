package week9;

import java.util.Scanner;
import java.io.File;
import java.io.IOException;
public class BSTConsole
{

	static int choice;
	static Scanner input = new Scanner(System.in);
	static BinarySearchTree bst = new BinarySearchTree();
	static int addressIP;
	static String userName;
	public static void main(String[] args)
	{
		do
		{
			System.out.print(
			"\n-------------------------\n"
			+ "1 Build Users Tree\n"
			+ "2 Find by IP Address\n"
			+ "3 Find by Username\n"
			+ "4 Report Number of Nodes\n"
			+ "5 Print Entire Tree\n"
			+ "6 Exit\n"
			+ "-------------------------\n"
			+ "Enter 1, 2, 3, 4, 5 or 6: \n");
		 

		        choice = input.nextInt();
		        input.nextLine();

			    switch(choice)
			    {
				    case 1:
				    	Scanner sc = null;
				        try 
				        {
				          sc = new Scanner(new File("/Users/tays012/Documents/GitHub/CSIS2420/Utilities/users.csv"));

				          // Check if there is another line of input
				          while(sc.hasNextLine())
				          {
				            String str = sc.nextLine();
				            // parse each line using delimiter
				            parseData(str);
				            bst.insert(addressIP, userName);
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
				        System.out.println("Build Successful");
				    	break;
				    	
				    case 2:
				    	System.out.print("Enter last 3 digits of IP address to search: ");
				    	int searchedIP = input.nextInt();
				    	input.nextLine();
				    	System.out.println(bst.searchRecursive(bst.root, searchedIP));
				    	break;
				    	
				    case 3:
				    	System.out.print("Enter the Username to search: ");
				    	String searchedUserName = input.nextLine();
				    	System.out.println(bst.searchUserName(bst.root, searchedUserName));
				    	break;
				    	
				    case 4:
				    	System.out.println("Total number of nodes: " + bst.depth(bst.root));
				        break;

				    case 5:
				    	System.out.print("The whole tree: ");
				    	bst.preOrderTraverse(bst.root);
				    	System.out.println();
				        break;
				        
				    case 6:
				    	System.out.println("Exiting Console");
				        break;

				    default:
				    System.out.println(choice + " is not a valid Menu Option! Please Select Another.");
			    }
			}while(choice != 6); /*Exit loop when choice is 6*/
		    input.close();
	}
	
    
  private static void parseData(String str)
  {  
    Scanner lineScanner = new Scanner(str);
    lineScanner.useDelimiter(",");
    while(lineScanner.hasNext())
    {
      addressIP = Integer.parseInt(lineScanner.next());
      userName = lineScanner.next();
    }
    lineScanner.close();
  }
}
