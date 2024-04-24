/*****************************************
 * Author : Taylor Shipley
 * Date : 04/26/2021
 * Assignment: Lab – MagicSquare
 *******************************************/
public class Main
{
	static int N = 4;
	static boolean isMagicSquare(int square[][])
	{
		int sum = 0,sum2 = 0;
		for (int i = 0; i < N; i++)
		{
			sum = sum + square[i][i];
		}
		for (int i = 0; i < N; i++)
		{
			sum2 = sum2 + square[i][N-1-i];
		}
		if(sum != sum2)
		{
			return false;
		}
		for (int i = 0; i < N; i++)
		{
			int rowSum = 0;
			for (int j = 0; j < N; j++)
			{
				rowSum += square[i][j];
			}
			if (rowSum != sum)
			{
				return false;
			}
		}
		for (int i = 0; i < N; i++)
		{
			int colSum = 0;
			for (int j = 0; j < N; j++)
			{
				colSum += square[j][i];
			}
			if (sum != colSum)
			{
				return false;
			}
		}
		return true;
	}
	public static void main(String[] args)
	{
		int square[][] = {{8, 11, 14, 1}, {13, 2, 7,12}, { 3, 16, 9, 6}, {10, 5, 4, 15}};
      System.out.printf("The square %s a magic square. %n",(isMagicSquare(square) ? "is" : "is not"));
	}
}
