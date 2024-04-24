/*****************************************
 * Author : Taylor Shipley
 * Date : 04/26/2021
 * Assignment: Lab – Martian Part 2
 *******************************************/
public class MartiansApp
{
	public static void main(String[] args)
	{
	   test();
	   
	   Martian[] invaders = Martian.invade(13);
	   System.out.println("\nName of Invaders: ");
	   for (int i = 0; i < invaders.length; i++)
	   {
		   System.out.println(invaders[i].name);
		}
		
		Martian[] unkownInvaders = Martian.invade();
		System.out.println("\nName of Unkown Invaders:");
	   for (int i = 0; i < unkownInvaders.length; i++)
	   {
		   System.out.println(unkownInvaders[i]);
		}
		for (Martian m: unkownInvaders)
		{
		   m.doSomething();
		}
	}
	public static void test()
   {
		Martian martian0 = new Martian();
		System.out.println(martian0);
		Martian martian1 = new Martian();
		System.out.println(martian1);
		Martian martian2 = new Martian();
		System.out.println(martian2);
		Martian[] martians = {martian0, martian1, martian2};
		for (int i = 0; i < martians.length; i++)
		{
		   martians[i].doSomething();
		}
   }
}
