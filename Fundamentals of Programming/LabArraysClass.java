/*****************************************
 * Author : Taylor Shipley
 * Date : 04/26/2021
 * Assignment: Lab – Arrays Class
 *******************************************/
import java.util.Arrays;
public class LabArraysClass 
{
	public static void main(String[] args)
	{
		int[] iArray1 = {6, 12, 3, 9};
		int[] iArray2 = new int[5];
		
		// fill iArray2 with 7	
		for (int i = 0; i < iArray2.length; i++)
		{
		   iArray2[i] = 7;
		}
		
		// print iArray1 and iArray2 (toString)
		System.out.println("iArray1: " + Arrays.toString(iArray1));
		System.out.println("iArray2: " + Arrays.toString(iArray2));
		
		// search for number 9 in iArray1 and print the value returned:
		int intKey = 9;
      System.out.println(intKey + " in iArray1: " + Arrays.binarySearch(iArray1,intKey));
      
		// sort iArray1 and print it
      Arrays.sort(iArray1);
      System.out.println("iArray1: " + Arrays.toString(iArray1));
      
		// search for number 9 in iArray1 and print the value returned:
		System.out.println(intKey + " in iArray1: " + Arrays.binarySearch(iArray1,intKey));
		
		// create iArray3 and assign it the first 3 elements of iArray1; print it
			int[]	iArray3 = new int[3];
			for (int i = 0; i < 3; i++)
		{
		   iArray3[i] = iArray1[i];
		   System.out.println("iArray3: " + Arrays.toString(iArray3));
		} 
		
		// test equality of new int[] {3, 6, 9} and iArray3; print result
		int[] testArr = {3, 6, 9};
		System.out.println("iArray3 equals [3, 6, 9]: " + Arrays.equals(testArr, iArray3));
	}
}
