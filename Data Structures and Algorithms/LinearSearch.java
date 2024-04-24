package week3;

import java.util.Random;

public class LinearSearch
{
	static int comparisons = 0;
	static int numElements = 100;
	//static int numElements = 1000;
	//static int numElements = 100000;
	//static int numElements = 1000000;
	//static int numElements = 10000000;
	public static void main(String[] args)
	{
	  Runtime runtime = Runtime.getRuntime();
      runtime.gc();
      long startMem = runtime.totalMemory() - runtime.freeMemory();
      int min = 10000;
      int max = 99999;
      Random rand = new Random();
      int dataArray[] = new int[numElements];
      for (int i = 0; i < dataArray.length; i++)
      {
          dataArray[i] = (rand.nextInt((max - min) + 1) + min);
      }
      
    int searchValue = 34;
    int result = linearSearch(dataArray, searchValue);
    if (result > -1)
    {
      System.out.println("The value " + searchValue +
	          " was found at array index " + result);
    }
    else
    {
      System.out.println("The value " + searchValue +
	          " was not found in the array.");
    }
    long finalMem = runtime.totalMemory() - runtime.freeMemory();
    long usedMem = finalMem - startMem;
    //System.out.println("Used memory is bytes: " + usedMem);
  }

  static int linearSearch(int searchArray[], int seekValue)
  {
      for (int i = 0; i < searchArray.length; i++)
      {
    	  comparisons++;
          if (searchArray[i] == seekValue)
          {
        	  System.out.println(numElements + " elements: " + comparisons + " comparisons");
        	  return i;
          }
      }
      System.out.println(numElements + " elements: " + comparisons + " comparisons");
      return -1;
  }
}