package week3;

import java.util.Random;

class BinarySearch
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
    int searchValue = 22;
    int result = binarySearch(dataArray, searchValue);
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
  }

  static int binarySearch(int searchArray[], int seekValue)
  {
    int low = 0;
    int high = searchArray.length - 1;
    while (low <= high) 
    {	
    	comparisons++;
    	int mid = low + (high- low) / 2;
        if (searchArray[mid] == seekValue)
        {
        	System.out.println(numElements + " elements: " + comparisons + " comparisons");
            return mid;
        }
        if (searchArray[mid] < seekValue)
        	low = mid + 1;
        else
        	high = mid - 1;
    }
    System.out.println(numElements + " elements: " + comparisons + " comparisons");
	return -1;
  }
}