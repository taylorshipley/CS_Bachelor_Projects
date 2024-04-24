package recursion;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

/**
 *
 * JUnitTests for 'Assignment Recursion|JUnit' method toUpper.
 *
 * @author CSIS 1410 - Test Code Provided
 *
 */
class ToUpperTest {
	
	@Test
	void toUpper_blankBeforeLetter() 
	{
		assertEquals("  A", Recursion.toUpper(" A"));
	}
	
	
	@Test
	void toUpper_blankAfterLetter() {
		assertEquals("A  ", Recursion.toUpper("A "));
	}
	
	@Test
	void toUpper_blankBetweenLetters() {
		assertEquals("A   B", Recursion.toUpper("A B"));
	}
	
	@Test
	void toUpper_2blanksBeforeAnd3blanksAfterLetter() {
		assertEquals("    A      ", Recursion.toUpper("  A   "));
	}
	
	@Test
	void toUpper_lowerCaseLetter() {
		assertEquals("A", Recursion.toUpper("a"));
	}

	@Test
	void toUpper_3lowerCaseLetters() {
		assertEquals("A B C", Recursion.toUpper("abc"));
	}
	
	@Test
	void toUpper_nonLetters() {
		assertEquals("& 2 *", Recursion.toUpper("&2*"));
	}
	
	@Test
	void toUpper_emptyString() {
		assertEquals("", Recursion.toUpper(""));
	}

	@Test
	void toUpper_mixedCaseLetters() {
		assertEquals("F I R S T A N D L A S T", Recursion.toUpper("fIRSTandLASt"));
	}

	@Test
	void toUpper_randomCharacters() {
		assertEquals("H # E % L L O ^ T H ;   E ^ R E", Recursion.toUpper("h#e%LlO^Th; e^RE"));
	}
}
