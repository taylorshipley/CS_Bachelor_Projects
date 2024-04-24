/***************************************************
* Author: Taylor Shipley
* Date: 04/02/2021
* Assignment: A09 Dice
****************************************************/
import java.util.Random;
public class Dice
{
   public static void main(String[] args) 
	{
		Random rand = new Random();
		int roll1;
		int roll2;
		int rollSum = 0;
		double[] frequency = new double[11];
		double[] precentage = new double[11];
      for (int x = 1; x <= 36000; x++ )
      {
         for (int i = 0; i < 2; i++)
         {
            roll1 = rand.nextInt(6) + 1;
            roll2 = rand.nextInt(6) + 1;
            rollSum = roll1 + roll2;
         }
         switch (rollSum)
      	{
         	case 2:
         	   frequency[0] += 1;
         	   break;
         	case 3:
         	   frequency[1] += 1;
         	   break;
         	case 4:
         	   frequency[2] += 1;
         	   break;
         	case 5:
         	   frequency[3] += 1;
         	   break;
         	case 6:
         	   frequency[4] += 1;
         	   break;
         	case 7:
         	   frequency[5] += 1;
         	   break;
         	case 8:
         	   frequency[6] += 1;
      	      break;
      	  case 9:
         	   frequency[7] += 1;
         	break;
         	case 10:
         	   frequency[8] += 1;
         	break;
         	case 11:
         	   frequency[9] += 1;
         	break;
         	case 12:
         	   frequency[10] += 1;
         	break;
      	}
      }
      for (int r = 0; r <= 10; r++)
      {
         precentage[r] = (frequency[r] / 36000) * 100;
      }
      System.out.printf("%s %10s %12s\n", "Sum", "Frequency", "Precentage");
      for (int a = 0; a <= 10; a++)
      {
         System.out.printf("%3d %10.0f %11.1f%%\n", a + 2, frequency[a], precentage[a]);
      }
	}
}
