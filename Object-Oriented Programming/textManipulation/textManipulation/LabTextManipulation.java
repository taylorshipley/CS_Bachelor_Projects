package textManipulation;
import java.util.ArrayList;
import java.lang.Character;
import java.util.Scanner;

/**
 * @author Taylor Shipley
 */

/**
 * LabTextManipulation reads in a user's favorite National Parks and prints them in the format {park1} | {park2} | {park3}
 * User's input is not case sensitive, LabTextManipulation will update inputs to be Title Cased.
 */
public class LabTextManipulation 
{
	public static void main(String[] args) 
	{
		ArrayList<String> parks = new ArrayList<String>();
		Scanner input = new Scanner(System.in);
		int escapeLoop = 0;
		String EscapeCode = "DONE";
		String userInput;
		do
		{
			System.out.println("Please enter your favorite National Park or DONE to stop: ");
			userInput = input.nextLine();
			if (userInput.equalsIgnoreCase(EscapeCode))
			{
				escapeLoop = 1;
				input.close();
			}
			else
			{
				parks.add(userInput);
			}
		}
		while (escapeLoop != 1);
		
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < parks.size(); i++)
		{
			if (i == parks.size() -1)
			{
				sb.append(updateSpelling(parks.get(i)));
			}
			else
			{
				sb.append(updateSpelling(parks.get(i)));
				sb.append(" | ");
			}
		}
		System.out.print(sb);
	}
	
	/**
	 * Updates capitalization of parameter to be in Title Case format.
	 *
	 * @param unformatted String
	 * @return Title Cased String
	 */
	private static String updateSpelling(String text)
	{
		if (text == null || text.isEmpty()) 
		{
	        return text;
	    }

	    StringBuilder updated = new StringBuilder();
	    boolean updateNext = true;
	    for (char ch : text.toCharArray()) 
	    {
	        if (Character.isSpaceChar(ch)) 
	        {
	            updateNext = true;
	        } 
	        else if (updateNext) 
	        {
	            ch = Character.toTitleCase(ch);
	            updateNext = false;
	        }
	        else 
	        {
	            ch = Character.toLowerCase(ch);
	        }
	        updated.append(ch);
	    }
	    return updated.toString();
	}
	 
}
