package docComments;

/**
 * Creates an object Computer.
 * Creates a Unique ID used to track each computer.
 * Stores details about the Computers Storage Capacity, Cost, and Operating System and Unique ID.
 * @author Taylor Shipley
 */
public class Computer 
{
	
	/** The id counter seed value used to generate the UniqueID. */
	private static int idCounter = 1000000;
	
	/** The storage capacity of the computer measured in GB. */
	public int storageInGB;
	
	/** The price of the computer measured in USD. */
	public int cost;
	
	/** The name of the operating system the computer uses*/
	public String operatingSystem;
	
	/** The number used to identify the computer. */
	public int uniqueID;
	
	
	
	/**
	 * Gets the storage capacity of the computer measured in GB.
	 *
	 * @return The storage size of the computer by
	 */
	private int getStorageInGB() 
	{
		return storageInGB;
	}

	/**
	 * Gets the price of the computer.
	 *
	 * @return the cost
	 */
	private int getCost() 
	{
		return cost;
	}



	/**
	 * Gets the operating system.
	 * @return the operatingSystem
	 */
	private String getOperatingSystem() 
	{
		return operatingSystem;
	}



	/**
	 * Gets the unique ID.
	 * @return the uniqueID
	 */
	public int getUniqueID() 
	{
		return uniqueID;
	}


	/**
	 * Instantiates a new computer.
	 * @param storageSize The storage capacity of the computer measured in GB.
	 * @param cost the price of the computer
	 * @param operatingSystem the operating system that the computer uses.
	 * @param uniqueID The price of the computer measured in USD.
	 */
	public Computer(int storageSize, int cost, String operatingSystem, int uniqueID)
	{
		this.storageInGB = storageSize;
		this.cost = cost;
		this.operatingSystem = operatingSystem;
		this.uniqueID = uniqueID;
	}



	/**
	 * To string.
	 * @return the formated string
	 */
	@Override
	public String toString() {
		return "storageSizeInGB: " + storageInGB + ", cost: " + cost + ", operatingSystem: " + operatingSystem + ", uniqueID: " + uniqueID;
	}

	/**
	 * Generates a number that equals +1 the previously generated number.
	 * @return the newly generated number
	 */
	public static synchronized int createID()
	{ 
	    return idCounter++;
	} 
}



