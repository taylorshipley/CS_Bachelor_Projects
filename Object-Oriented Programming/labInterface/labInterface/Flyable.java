package labInterface;
/**
 * @author Taylor Shipley
 */

/**
 * The Interface Flyable.
 */
public interface Flyable 
{
	
	/**
	 * Launches the flyable object.
	 * Overrriden by the object to launch via it's method.
	 */
	void launch();
	
	/**
	 * Lands the flyable object.
	 * Overrriden by the object to land via it's method.
	 */
	void land();
	
	
}
