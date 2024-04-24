package week2;
import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files

public class Week2Part2 
{
	public static void main(String[] args) 
	{
		int rows = 0;
		float total = 0;
	    try 
	    {
	    	File text = new File("/Users/tays012/eclipse-workspace/CSIS2420/src/week2/Week2Part2.txt");
	    	Scanner scnnr = new Scanner(text);
	    	while (scnnr.hasNextLine()) 
	    	{
	    		Float data = scnnr.nextFloat();
	    		total += data;
	    		rows++;
	    	}
	    	scnnr.close();
	    } 
	    catch (FileNotFoundException e) 
	    {
	      System.out.println("File does not Exist");
	      e.printStackTrace();
	    }
	    float avg = total/rows;
	    System.out.printf("Rows: %,d Average: %,.2f", rows, avg);
	}	      
}
