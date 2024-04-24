package week2;
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.Scanner; 

public class Week2Part1 
{
	public static void main(String[] args) 
	{
		int min;
		int max = 0;
		boolean validInput = false;
		int total = 0;
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter Minimum: ");
		min = scanner.nextInt();
		scanner.nextLine();
		do
		{
			System.out.print("Enter Maximum: ");
			int maxInput = scanner.nextInt();
			scanner.nextLine();
			if (maxInput <= min)
			{
				System.out.println("Maximum must be greater than Minimum: " + min);
			}
			else
			{
			validInput = true;
			max = maxInput;
			}
		} while (validInput == false);
		scanner.close();
		for (int i = min; i <= max; i++)
		{
			total = total + i;
		}
		NumberFormat addComma = NumberFormat.getInstance();
		addComma.setGroupingUsed(true);
		System.out.println("The sum of all numbers from the minimum to the maximum is " + addComma.format(total));
		System.out.println();
		System.out.println();
		
		int[][] gameScores =
		{
			{44,63,45,23,76,45},
			{76,23,56,98,33,24},
			{23,71,92,39,45,44},
			{70,20,46,64,77,29},
			{83,45,99,20,10,21},
			{86,34,92,34,88,11}
		};
		int scoreTotal;
		int[] scores = new int[6];
		int highScore = 0;
		int highScoreRow = 0;
		for (int i=0; i<6; i++)
		{
			scoreTotal = 0;
			for (int t=0; t<6; t++)
			{
				scoreTotal += gameScores[i][t];
			}
			scores[i] = scoreTotal;
			if (scoreTotal > highScore)
			{
				highScoreRow = i + 1;
			}
		}
		System.out.println("----------------------\n" + "Total Scores\n" + "----------------------");
		for (int i=0; i<6; i++)
		{
			System.out.println("Row "+ (i + 1) + ": " + scores[i]);
		}
		Arrays.sort(scores);
		System.out.println("----------------------\n" + "High Score: Row " + highScoreRow);
		System.out.println("----------------------");
	}
}
