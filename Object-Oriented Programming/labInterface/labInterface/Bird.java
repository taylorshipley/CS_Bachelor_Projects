package labInterface;

/**
 * @author CSIS & Taylor Shipley
 */

/**
 * The Class Bird.
 */
public class Bird implements Flyable
{
	
	/** The type. */
	private final String type;

	/**
	 * Instantiates a new bird.
	 *
	 * @param t The name of the species of bird
	 */
	public Bird(String t)
	{
		type = t;
	}

	@Override
	public String toString()
	{
		return type;
	}

	@Override
	public void launch()
	{
		System.out.println("Flapping the wings to take off");
	}

	@Override
	public void land() 
	{
		System.out.println("Flapping the wings until landing");
	}
	
	
}
