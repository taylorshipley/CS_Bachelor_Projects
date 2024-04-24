import java.util.Random; 
public class LabRandom
{
  public static void main (String[]args)
  {
     Random rand = new Random();
     int number;
     for (int x=1; x <= 10; x++ )
      {
        for (int i=1; i <= 10; i++)
        {
           number = rand.nextInt(4) + 4;
           System.out.printf("%-5d", number);
        }
        System.out.println();
      }
  }   
}