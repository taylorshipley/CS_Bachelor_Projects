import java.util.Random;
public class Martian
{
   // fields
   String name = "";
   static int count = 0;
   Random rand = new Random();
   
   // constructors
   Martian()
   {
     this.name = getRandomName();
     count++;
   }
   
   // methods
   public static Martian[] invade(int amount)
   {
      Martian[] army = new Martian[amount];
      for (int i = 0; i < amount; i++)
		{
		   army[i] = new Martian();
		}
		return army;
   }
   public static Martian[] invade()
   {
      int amount;
      Random r = new Random();
      amount = r.nextInt(9) + 2;
      Martian[] army = new Martian [amount];
      for (int i = 0; i < amount; i++)
		{
		   army[i] = new Martian();
		}
		return army;
   }
   public String getRandomName()
   {
      String randomName = "";
      randomName += (char) ('A' + rand.nextInt(26));
      randomName += rand.nextInt(88) + 10;
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