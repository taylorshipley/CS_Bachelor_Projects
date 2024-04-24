package abstractClass;

/**
 * @author Taylor Shipley
 */

 /**
 * The Class LaserPrinter.
 */
public class LaserPrinter extends Printer
{
	
	/** The level of toner remaining in the printer.*/
	private int remainingToner = 100;

	/**
	 * Instantiates a new printer of type laser printer.
	 *
	 * @param model The name of the printer's model
	 */
	public LaserPrinter(String model)
	{
		super(model);
	}
	
	/**
	 * Gets the remaining level of ink in the printer's Toner.
	 *
	 * @return The percentage of the remaining toner in the printer
	 */
	public int getRemainingToner()
	{
		return remainingToner;
	}
	
	/**
	 * Refills the toner level to 100%.
	 */
	public void refillToner()
	{
		remainingToner = 100;
	}

	/**
	 * Attempts to print an item. If Toner is empty printer won't print, else item is printed and Toner level is depleted by 10%.
	 */
	@Override
	public void print() 
	{
		
		if (remainingToner == 0)
		{
			System.out.println("The Toner is empty.");
		}
		else 
		{
			remainingToner -= 10;
			System.out.println(super.getModel() + " is printing. Remaining Toner: " + remainingToner + "%");
		}
	}

}
