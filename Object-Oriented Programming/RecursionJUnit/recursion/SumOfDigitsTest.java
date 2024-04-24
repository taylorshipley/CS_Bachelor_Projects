package recursion;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

/**
*
* JUnitTests for 'Assignment Recursion|JUnit' method sumOfDigits.
*
* @author CSIS 1410 - Test Code Provided
*
*/
class SumOfDigitsTest {
	
	@Test
	void sumOfDigits_zero() {
		assertEquals(0, Recursion.sumOfDigits(0));
	}

	@Test
	void sumOfDigits_positiveDigit() {
		assertEquals(1, Recursion.sumOfDigits(1));
	}

	@Test
	void sumOfDigits_negativeDigit() {
		assertEquals(5, Recursion.sumOfDigits(-5));
	}

	@Test
	void sumOfDigits_numberWithZeros() {
		assertEquals(8, Recursion.sumOfDigits(20_060));
	}

	@Test
	void sumOfDigits_shortNumber() {
		assertEquals(5, Math.abs(Recursion.sumOfDigits(32)));
	}
	
	@Test
	void sumOfDigits_longNumber() {
		assertEquals(33, Recursion.sumOfDigits(252_373_245));
	}

	@Test
	void sumOfDigits_negativeNumber() {
		assertEquals(13, Recursion.sumOfDigits(-634));
	}

	@Test
	void sumOfDigits_leadingZero() {
		// a leading 0 indicates that it is a number with base 8
		// https://www.mathsisfun.com/definitions/octal.html
		// 0167 (octal) is 119 (decimal) and the sum of digits of 119 is 11
		assertEquals(11, Recursion.sumOfDigits(0167));
	}
	
}
