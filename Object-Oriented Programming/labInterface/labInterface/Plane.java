package labInterface;

/**
 * @author CSIS & Taylor Shipley
 */

/**
 * The Class Plane.
 */
public class Plane implements Flyable
{
	
	/** The number of engines the plane has. */
	private final int numberOfEngines;
	
	/** The name of the plan'es model. */
	private final String model;

	/**
	 * Instantiates a new plane.
	 *
	 * @param engines 	The number of engines the plane has.
	 * @param m 	The name of the plane's model.
	 */
	public Plane(int engines, String m)
	{
		numberOfEngines = engines;
		model = m;
	}

	@Override
	public String toString()
	{
		return String.format("%s with %d engines", model, numberOfEngines);
	}

	@Override
	public void launch() 
	{
		System.out.println("Rolling until take-off");
	}

	@Override
	public void land() 
	{
		System.out.println("Rolling to a stop");
	}
	
	
}
