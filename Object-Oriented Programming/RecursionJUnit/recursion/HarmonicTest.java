package recursion;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

public class HarmonicTest
{
	private final double delta = 0.000000001;
	
	@Test
	void Recursion_HarmonicOfZero_ThrowsIllegalArgumentException() 
	{
		assertThrows(IllegalArgumentException.class, 
				() -> {Recursion.harmonic(0);});
	}
	
	@Test
	void Recursion_HarmonicOfNegativeFive() 
	{
		assertEquals(-2.2833333333, Recursion.harmonic(-5), delta);
	}
	
	@Test
	void Recursion_HarmonicOfNegativeFifty() 
	{
		assertEquals(-4.499205338, Recursion.harmonic(-50), delta);
	}
	
	@Test
	void Recursion_HarmonicOfOne() 
	{
		assertEquals(1, Recursion.harmonic(1), delta);
	}
	@Test
	void Recursion_HarmonicOfFifty() 
	{
		assertEquals(4.499205338, Recursion.harmonic(50), delta);
	}
}
