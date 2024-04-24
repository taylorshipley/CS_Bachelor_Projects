import java.util.Random;
public class Martian
{
   // fields
   public String name;
   public static int count = 0;
   Random rand = new Random();
   
   // constructors
   public Martian()
   {
     name = getRandomName();
     count++;
   }
   
   // methods
   public Martian[] invade(int amount)
   {
      Martian[] army = new Martian[amount];
      for (int i = 0; i < army.length; i++)
		{
		   name = getRandomName();
		   army[i] = name;
		   count++;
		}
		return army;
   }
   public String[] invade()
   {
      int amount = rand.nextInt(9) + 2;
      String[] army = new String [amount];
      for (int i = 0; i < army.length; i++)
		{
		   name = getRandomName();
		   army[i] = name;
		   count++;
		}
		return army;
   }
   public String getRandomName()
   {
     char letter = (char) ('A' + rand.nextInt(26));
     int number = rand.nextInt(88) + 10;
     String randomName = convertToString(letter, number);
     return randomName;
   }
   public String convertToString(char c, int num)
   {
     return String.format("%s%s", c, num);
   }
   @Override
	public String toString()
	{
	   return String.format("%s\\%s", name, count);
	}
	public void doSomething()
	{
	   if (count < 5)
	   {
	      System.out.println(name + " is hiding");
	   }
	   else
	   {
	      System.out.println("ATTACK!");
	   }
	}
}