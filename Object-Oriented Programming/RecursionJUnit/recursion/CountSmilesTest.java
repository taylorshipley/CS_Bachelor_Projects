package recursion;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

/**
*
* JUnitTests for 'Assignment Recursion|JUnit' method countSmiles.
*
* @author CSIS 1410 - Test Code Provided
*
*/
class CountSmilesTest {

	@Test
	void countSmiles_smile() {
		assertEquals(1, Recursion.countSmiles(":)".toCharArray(), 0));
	}
	
	@Test
	void countSmiles_longSmile() {
		assertEquals(0, Recursion.countSmiles(": )".toCharArray(), 0));
	}
	
	@Test
	void countSmiles_FrounySmile() {
		assertEquals(0, Recursion.countSmiles(":(".toCharArray(), 0));
	}
	
	@Test
	void countSmiles_colonOnly() {
		assertEquals(0, Recursion.countSmiles(":".toCharArray(), 0));
	}
	
	@Test
	void countSmiles_NoEyes() {
		assertEquals(0, Recursion.countSmiles(")".toCharArray(), 0));
	}
	
	@Test
	void countSmiles_backwardSmile() {
		assertEquals(0, Recursion.countSmiles("(:".toCharArray(), 0));
	}
	
	@Test
	void countSmiles_backwardLongSmile() {
		assertEquals(0, Recursion.countSmiles("( :".toCharArray(), 0));
	}
	
	@Test
	void countSmiles_noSmiles() {
		assertEquals(0, Recursion.countSmiles("Zero Smiles Here!".toCharArray(), 0));
	}
	
	@Test
	void countSmiles_emptyCharArray() {
		assertEquals(0, Recursion.countSmiles(new char[0], 0));
	}

	@Test
	void countSmiles_threeSmiles() {
		assertEquals(3, Recursion.countSmiles(":):):)".toCharArray(), 0));
	}

	@Test
	void countSmiles_twoSmilesWithMultiples() {
		assertEquals(3, Recursion.countSmiles(" :) ::)) :::))) ".toCharArray(), 0));
	} 
	
	@Test
	void countSmiles_multipleSmilesStartAt1() {
		assertEquals(4, Recursion.countSmiles("0:):)5:):)end".toCharArray(), 1));
	}
	
	@Test
	void countSmiles_multipleSmilesStartAt2() {
		assertEquals(3, Recursion.countSmiles("0:):)5:):)end".toCharArray(), 2));
	}	
	
	@Test
	void countSmiles_multipleSmilesStartAt4() {
		assertEquals(2, Recursion.countSmiles("0:):)5:):)end".toCharArray(), 4));
	}	
	
	@Test
	void countSmiles_multipleSmilesStartAt9() {
		assertEquals(0, Recursion.countSmiles("0:):)5:):)end".toCharArray(), 9));
	}
	
	@Test
	void countSmiles_multipleSmilesStartAt11() {
		assertEquals(0, Recursion.countSmiles("0:):)5:):)end".toCharArray(), 11));
	}	

	@Test
	void countSmiles_leadingSpaces() {
		assertEquals(1, Recursion.countSmiles("   :)  ".toCharArray(), 2));
	} 
}
