package codingBat;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

public class CodingBatTest 
{
	@Test
	void wordEnds_Test1_True() 
	{
		assertTrue(CodingBat.wordEnds("abcXY123XYijk", "XY").equals("c13i"));
	}
	
	@Test
	void wordEnds_Test2_True() 
	{
		assertTrue(CodingBat.wordEnds("XY123XY", "XY").equals("13"));
	}
	
	@Test
	void wordEnds_Test3_True() 
	{
		assertTrue(CodingBat.wordEnds("XY1XY", "XY").equals("11"));
	}
	
	@Test
	void wordEnds_Test4_True() 
	{
		assertTrue(CodingBat.wordEnds("XYXY", "XY").equals("XY"));
	}
	
	@Test
	void wordEnds_Test5_True() 
	{
		assertTrue(CodingBat.wordEnds("XY", "XY").equals(""));
	}
	
	@Test
	void wordEnds_Test6_True() 
	{
		assertTrue(CodingBat.wordEnds("Hi", "XY").equals(""));
	}
	
	@Test
	void wordEnds_Test7_True() 
	{
		assertTrue(CodingBat.wordEnds("", "XY").equals(""));
	}
	
	@Test
	void wordEnds_Test8_True() 
	{
		assertTrue(CodingBat.wordEnds("abc1xyz1i1j", "1").equals("cxziij"));
	}
	
	@Test
	void wordEnds_Test9_True() 
	{
		assertTrue(CodingBat.wordEnds("abc1xyz1", "1").equals("cxz"));
	}
	
	@Test
	void wordEnds_Test10_True() 
	{
		assertTrue(CodingBat.wordEnds("abc1xyz11", "1").equals("cxz11"));
	}
	
	@Test
	void wordEnds_Test11_True() 
	{
		assertTrue(CodingBat.wordEnds("abc1xyz1abc", "abc").equals("11"));
	}
	
	@Test
	void wordEnds_Test12_True() 
	{
		assertTrue(CodingBat.wordEnds("abc1xyz1abc", "b").equals("acac"));
	}
	
	@Test
	void wordEnds_Test13_True() 
	{
		assertTrue(CodingBat.wordEnds("abc1abc1abc", "abc").equals("1111"));
	}
	
}
