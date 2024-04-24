package week6;

public class PlayerLinkedList 
{
	PlayerNode head;
	
	
	public void append(PlayerNode next, int playerID, String firstName, String lastName, String playerName,
			PlayerType playerType, double lifePoints, int totalScore)
	{
		if (head == null)
		{
			head = new PlayerNode(head, playerID, firstName,lastName, playerName, playerType, lifePoints, totalScore);
			return;
		}
		PlayerNode current = head;
		while (current.next != null)
		{
			current = current.next;
		}
		current.next = new PlayerNode(null, playerID, firstName,lastName, playerName, playerType, lifePoints, totalScore);
	}
	
	
	public void delete(int playerID)
	{
		PlayerNode current = head;
		PlayerNode previous = null;
		if (head != null && current.playerID == playerID)
		{
			head = current.next;
			return;
		}
		while (current != null && current.playerID != playerID)
		{
			previous = current;
			current = current.next;
		}
		if (current == null)
		{
			return;
		}
		previous.next = current.next;
	}

	
	public int length()
	{
		int len = 0;
		PlayerNode current = head;
		while (current != null)
		{
			len++;
			current = current.next;
		}
		return len;

	}

	
	public void prepend(PlayerNode next, int playerID, String firstName, String lastName, String playerName,
			PlayerType playerType, double lifePoints, int totalScore)
	{
		PlayerNode newHead = new PlayerNode(head, playerID, firstName,lastName, playerName, playerType, lifePoints, totalScore);
		newHead.next = head;
		head = newHead;
	}

	
	public void printPlayerList()
	{
		PlayerNode current = head;
		System.out.println();
		printLine(35);
		System.out.print("Player   L i s t\n");
		printLine(35);
		System.out.println("Player ID\t Name\t\t Player Name\t Player Type\t Life Points\t Total Score\t ");
		printLine(35);
		while (current != null)
		{
			System.out.println( current.playerID + " " + current.firstName + " " + current.lastName + " " + current.playerName + " " + current.playerType + " " + current.lifePoints + " " + current.totalScore);
			current = current.next;
		}
	}

	
	public String search(int playerID)
	{
	    String result = "Not found";
	    if (head == null) return "Empty List";
	    PlayerNode current = head;
	    if (head.playerID == playerID)
	    {
	        result = "Player ID: " + head.playerID
	            + " Name: " + head.firstName + " "
	            + head.lastName + " Player Name: "
	            + head.playerName + " Player Type: "
	            + head.playerType + " Life Points: "
	            + head.lifePoints + " Total Score: "
	            + head.totalScore;
	    }
	    else
	    {
	        while (current.next != null)
	        {
	            if (current.next.playerID == playerID)
	            {
	            	result = "Player ID: " + head.playerID
	        	            + " Name: " + head.firstName + " "
	        	            + head.lastName + " Player Name: "
	        	            + head.playerName + " Player Type: "
	        	            + head.playerType + " Life Points: "
	        	            + head.lifePoints + " Total Score: "
	        	            + head.totalScore;
	            }
	            current = current.next;
	         }
	    }
	    return result;
	}


	public String search(String firstName, String lastName)
	{
		String result = "Not found";
	    if (head == null) return "List Empty";
	    PlayerNode current = head;
	    if (head.firstName.equalsIgnoreCase(firstName) && 
	    	head.lastName.equalsIgnoreCase(lastName))
	    {
	    	result = "Player ID: " + head.playerID
		            + " Name: " + head.firstName + " "
		            + head.lastName + " Player Name: "
		            + head.playerName + " Player Type: "
		            + head.playerType + " Life Points: "
		            + head.lifePoints + " Total Score: "
		            + head.totalScore;
	    }
	    else
	    {
	        while (current.next != null)
	        {
	            if (current.next.firstName.equalsIgnoreCase(firstName) && 
	            	current.next.lastName.equalsIgnoreCase(lastName))
	            {
	            	result = "Player ID: " + head.playerID
	        	            + " Name: " + head.firstName + " "
	        	            + head.lastName + " Player Name: "
	        	            + head.playerName + " Player Type: "
	        	            + head.playerType + " Life Points: "
	        	            + head.lifePoints + " Total Score: "
	        	            + head.totalScore;
	                break;
	            }
	            current = current.next;
	        }
	    }
	    return result;
	}
	public String search(String playerName)
	{
		String result = "Not found";
	    if (head == null) return "List Empty";
	    PlayerNode current = head;
	    if (head.playerName.equals(playerName))
	    {
	    	result = "Player ID: " + head.playerID
		            + " Name: " + head.firstName + " "
		            + head.lastName + " Player Name: "
		            + head.playerName + " Player Type: "
		            + head.playerType + " Life Points: "
		            + head.lifePoints + " Total Score: "
		            + head.totalScore;
	    }
	    else
	    {
	        while (current.next != null)
	        {
	            if (head.playerName.equals(playerName))
	            {
	            	result = "Player ID: " + head.playerID
	        	            + " Name: " + head.firstName + " "
	        	            + head.lastName + " Player Name: "
	        	            + head.playerName + " Player Type: "
	        	            + head.playerType + " Life Points: "
	        	            + head.lifePoints + " Total Score: "
	        	            + head.totalScore;
	                break;
	            }
	            current = current.next;
	        }
	    }
	    return result;
	}


	public void search(PlayerType playerType)
	{
		PlayerNode current = head;
		System.out.println();
		printLine(35);
		System.out.print("Player   L i s t\n");
		printLine(35);
		System.out.println("Player ID\t Name\t\t Player Name\t Player Type\t Life Points\t Total Score\t ");
		printLine(35);
		while (current != null)
		{
			if (current.playerType.equals(playerType))
			{
				System.out.println(current.playerID + " " + current.firstName + " " + current.lastName 
						+ " " + current.playerName + " " + current.playerType + " " + current.lifePoints + " " + current.totalScore);
			}
			current = current.next;
		}
	}
	public String highScore()
	{
	    PlayerNode current = head;
		PlayerNode highest = head;
		while (current != null)
		{
			if (current.totalScore > highest.totalScore)
			{
				highest = current;
			}
			current = current.next;
		}
		
		String highestPlayer = "Player ID: " + highest.playerID
	            + " Name: " + highest.firstName + " "
	            + highest.lastName + " Player Name: "
	            + highest.playerName + " Player Type: "
	            + highest.playerType + " Life Points: "
	            + highest.lifePoints + " Total Score: "
	            + highest.totalScore;;
		return highestPlayer;
	}
	public String lowScore()
	{
	    PlayerNode current = head;
		PlayerNode lowest = head;
		while (current != null)
		{
			if (current.totalScore < lowest.totalScore)
			{
				lowest = current;
			}
			current = current.next;
		}
		
		String lowestPlayer = "Player ID: " + lowest.playerID
	            + " Name: " + lowest.firstName + " "
	            + lowest.lastName + " Player Name: "
	            + lowest.playerName + " Player Type: "
	            + lowest.playerType + " Life Points: "
	            + lowest.lifePoints + " Total Score: "
	            + lowest.totalScore;;
		return lowestPlayer;
	}
	

	public void printLine(int n)
	{
		for (int i = 1; i <= n; i++)
		{
			System.out.print("-");
		}
		System.out.println();
	}
}
