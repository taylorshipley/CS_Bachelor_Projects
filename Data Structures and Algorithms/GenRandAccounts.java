package week9;

import java.io.*;
import java.util.Random;

public class GenRandAccounts 
{
	public static void main(String[] args) 
	{
		String dataFile = "AccountNumbers.csv";
		int min = 100000;
		int max = 999999;
		int numAccounts = 10;
		Random rand = new Random();
	    try 
	    { 
	    	File accountsFile = new File(dataFile); 
	    	if (accountsFile.exists()) 
	    	{
	    		accountsFile.delete();     
	        }
	        if (accountsFile.createNewFile()) 
	        { 
	        	System.out.println("File created: " + accountsFile.getName()); 
				FileWriter csvWriter = new FileWriter(accountsFile.getName());
	    		for (int i = 1; i <= numAccounts; i++)
	            {
					csvWriter.write(Integer.toString(rand.nextInt((max - min) + 1) + min) + "\n");
	            }
				csvWriter.close();
				System.out.printf("Number of Accounts Written to File: %,d", numAccounts);
	        }
	        else
	        { 
	        	System.out.println("File already exists."); 
	        } 
	    } 
	    catch (IOException e) 
	    {
	    	System.out.println("An error occurred.");
	    	e.printStackTrace(); 
	    } 
	}
}
