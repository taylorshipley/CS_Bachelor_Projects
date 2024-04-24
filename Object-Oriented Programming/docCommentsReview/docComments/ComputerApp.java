package docComments;
import java.util.ArrayList;
import java.util.Scanner;

/**
 * @author Taylor Shipley
 */
public class ComputerApp 
{
	public static void main(String[] args)
	{
		ArrayList<String> computers = new ArrayList<String>();
		Scanner input = new Scanner(System.in);
		int escapeCode = 0;
		do
		{
			System.out.printf("1. Show all computers "
					+ "\n2. Add a computer"
					+ "\n3. Find a computer"
					+ "\n4. Delete a computer"
					+ "\n5. Number of computers"
					+ "\n6. Exit \nEnter your selection: ");
			int selection = input.nextInt();
			input.nextLine();
			if (selection < 1 || selection > 6)
			{
				selection = 7;
			}
			switch (selection)
			{
			case 1:
				if (computers.isEmpty())
				{
					System.out.println("Null, there are no computers");
				}
				else
				{
					for (String m: computers)
					{
						System.out.println(m);
					}
				}
				break;
			case 2:
				System.out.println("Enter computer's storage capacity: ");
				int computerStorage = input.nextInt();
				input.nextLine();
				System.out.println("Enter USD value of computer: $");
				int computerValue = input.nextInt();
				input.nextLine();
				System.out.println("Enter name of the computer's operating system: ");
				String computerOS = input.nextLine();
				Computer myComputer = new Computer(computerStorage, computerValue, computerOS, Computer.createID());
				String myComputerString = myComputer.toString();
				computers.add(myComputerString);
				break;
			case 3:
				System.out.println("Enter UniqueID for the computer you want to find: ");
				int EnteredID = input.nextInt();
				String FindID = Integer.toString(EnteredID);
				int position = 0;
				int printCode = 0;
				if (EnteredID < 1000000)
				{
					printCode = 2;
				}
				for (String i : computers)
				{
					if (i.contains(FindID) && printCode == 0)
					{
						System.out.println(computers.get(position));
						printCode = 1;
					}
					position++;
				}
				if (printCode != 1)
				{
					System.out.println("The entered ID does not exist.");
				}
				break;
			case 4:
				System.out.println("Enter UniqueID for the computer you want to delete: ");
				int EnteredID2 = input.nextInt();
				String FindID2 = Integer.toString(EnteredID2);
				int position2 = 0;
				int printCode2 = 0;
				if (EnteredID2 < 1000000)
				{
					printCode2 = 2;
				}
				for (String i : computers)
				{
					if (i.contains(FindID2) && printCode2 == 0)
					{
						computers.remove(position2);
						System.out.println("Computer with UniqueID " + FindID2 +" has been deleted.");
						printCode2 = 1;
					}
					position2++;
				}
				if (printCode2 != 1)
				{
					System.out.println("The entered ID does not exist.");
				}
				break;
			case 5:
				System.out.println(computers.size());
				break;
			case 6:
				System.out.println("Goodbye");
				escapeCode = 1;
				input.close();
				break;
			case 7:
				System.out.println("Invalid selection, try again.");
				break;
			}
			System.out.println();
		}
		while (escapeCode == 0);
	}
}
