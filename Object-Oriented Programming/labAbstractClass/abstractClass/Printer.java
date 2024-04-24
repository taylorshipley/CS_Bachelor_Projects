package abstractClass;


/**
 * @author Taylor Shipley
 */

/**
 * The Superclass Printer.
 */
public abstract class Printer 
{
	
	/** The model name of the printer. */
	private String model;
	
	/** The count records how many printers have been created. */
	private static int count = 0;
	
	/** The serial number is a unique number to identify every created printer.
	 *  It's defined as 12345 + count.
	 */
	private int serialNumber;
	
	/**
	 * Instantiates a new printer.
	 *
	 * @param model 	The name of the printer's model.
	 */
	protected Printer(String model)
	{
		this.model = model;
		count++;
		serialNumber = count + 12345;
		
	}
	
	/**
	 * Returns the model name of selected printer.
	 *
	 * @return the model
	 */
	public String getModel()
	{
		return model;
	}
	
	/**
	 * Gets the serial number of selected printer.
	 *
	 * @return the serial number
	 */
	public int getSerialNumber()
	{
		return serialNumber;
	}
	
	/**
	 * Superclass method print, has the printer print something then updates & displays the remaining balance of toner/cartridge.
	 */
	public abstract void print();
	
	@Override
	public String toString() 
	{
		String className = this.getClass().getSimpleName();
		return className + ": " + model + " #" + serialNumber;
	}
}
	
	
