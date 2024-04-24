package abstractClass;


/**
 * @author Taylor Shipley
 * The Class InkjetPrinter.
 */
public class InkjetPrinter extends Printer
{
	
	/** The level of ink remaining in the printer's cartridge. */
	private int remainingCartridge = 100;
	
	/**
	 * Creates a new Printer of type Inkjet Printer.
	 *
	 * @param model 	The name of the printer's model
	 */
	protected InkjetPrinter(String model) 
	{
		super(model);
	}

	/**
	 * Gets the remaining level of ink in the printer's cartridge.
	 *
	 * @return the remaining ink in the cartridge.
	 */
	public int getRemainingCartridge()
	{
		return remainingCartridge;
	}
	
	/**
	 * Refills the printer's ink cartridge levels to 100%.
	 */
	public void refillCartridge()
	{
		remainingCartridge = 100;
	}
	
	/**
	 * Attempts to print an item. If Cartridge is empty printer won't print, else item is printed and Cartridge level is depleted by 10%.
	 */
	@Override
	public void print() 
	{
		if (remainingCartridge == 0)
		{
			System.out.println("The cartridge is empty.");
		}
		else 
		{
			remainingCartridge -= 10;
			System.out.println(super.getModel() + " is printing. Remaining cartridge: " + remainingCartridge + "%");
		}
	}

}
