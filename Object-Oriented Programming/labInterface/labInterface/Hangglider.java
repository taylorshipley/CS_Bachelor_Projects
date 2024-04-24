package labInterface;

/**
 * @author CSIS & Taylor Shipley
 */

/**
 * The Class Hangglider.
 */
public class Hangglider implements Flyable
{
	
	/** Boolean variable. Is the handglider a rigid wing: (true/false). */
	private final boolean isRigidWing;

	/**
	 * Instantiates a new hangglider.
	 *
	 * @param rigidWing 	Boolean variable. Is the handglider a rigid wing: (true/false).
	 */
	public Hangglider(boolean rigidWing)
	{
		isRigidWing = rigidWing;
	}

	@Override
	public String toString()
	{
		return String.format(isRigidWing ? "Rigid-wing" : "Flex-wing");
	}

	@Override
	public void launch() 
	{
		System.out.println("Running until take-off");
	}

	@Override
	public void land() 
	{
		System.out.println("Gliding to a land");
	}
	
	
}
