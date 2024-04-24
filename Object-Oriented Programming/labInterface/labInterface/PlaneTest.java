package labInterface;


import static org.junit.jupiter.api.Assertions.*;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

/**
 * @author Taylor Shipley
 */
class PlaneTest 
{
	private static ByteArrayOutputStream message;
	private static PrintStream consoleOutput;
	private Plane plane = new Plane(2, "A320");
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception
	{
		consoleOutput = System.out;
		message = new ByteArrayOutputStream();
		PrintStream newOutput = new PrintStream(message);
		System.setOut(newOutput);
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception 
	{
		System.setOut(consoleOutput);
	}

	@Test
	void testPlane() 
	{
		Plane expected = plane;
		assertSame(expected, plane);
	}

	@Test
	void ToString_validatePrintedMessage() 
	{
		String expected = "A320 with 2 engines";
		String actual = plane.toString();
		assertEquals(expected, actual);
	}

	@Test
	void launch_validatePrintedMessage() 
	{
		plane.launch();
		String expected = "Rolling until take-off" + System.lineSeparator();
		String actual = message.toString();
		assertEquals(expected, actual);
		
		message.reset();
	}

	@Test
	void land_validatePrintedMessage() 
	{
		plane.land();
		String expected = "Rolling to a stop" + System.lineSeparator();
		String actual = message.toString();
		assertEquals(expected, actual);
		
		message.reset();
	}

}
