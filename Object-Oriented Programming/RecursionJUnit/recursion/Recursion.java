package recursion;

public class Recursion 
{
	
	/*
	This method returns the sum of all the digits. Notice that the minus sign is ignored.
	sumOfDigits(-34) -> 7
	sumOfDigits(1038) -> 12
	*/
	public static int sumOfDigits(int n)
	{
		n = Math.abs(n);
		if (n == 0)
		{
			return n;
		}
		else
		{
			return (n % 10 + sumOfDigits(n/10));
		}
	}
	
	
	/*
	This method separates all characters by a space and changes all lowercase letters to uppercase letters.
	E.g., "Hi there!" returns "H I   T H E R E !" 
	Hint: Class Character (Links to an external site.) includes a method toUpperCase (Links to an external site.)​
	*/
	public static String toUpper(String str)
	{
		if (str.length()<1)
		{
			return "";
		}
		else if (str.length() > 1)
		{
			return Character.toUpperCase(str.charAt(0))+ " " + toUpper(str.substring(1));
		}
		else
		{
			return Character.toUpperCase(str.charAt(0)) + toUpper(str.substring(1));
		}
	}
	
	
	
	/*
	This method counts the number of colons followed by a closing parenthesis starting at the specified index.
	An empty character array should return 0.
	[A,:,b,)] indicates a char array with 4 characters: A, colon, b, and a closing parenthesis.
	countSmiles([:,), ,L,i,f,e, ,i,s, ,g,o,o,d, ,:,)], 0) -> 2
	countSmiles([a,:,b,(,c,),:, ,),e], 0) -> 0
	countSmiles([H,a,p,p,y, ,D,a,y, ,:,),:,),:,),!], 0) -> 3
	countSmiles([H,a,p,p,y, ,D,a,y, ,:,),:,),:,),!], 11) -> 2
	countSmiles([H,a,p,p,y, ,D,a,y, ,:,),:,),:,),!], 14) -> 1
	*/
	
	public static int countSmiles(char[] letters, int index)
	{
		if (letters.length -2 < index)
		{
			return 0;
		}
		if (letters[index] == ':' && letters[index + 1] == ')')
		{
			return 1 + countSmiles(letters, index + 1);
		}
		return countSmiles(letters, index + 1);
	}
	
	
	public static double harmonic (int n) 
	{
	   if (n == 0)
	      throw new IllegalArgumentException("The argument n can't be zero.");
	   
	   if (n == 1)
	      return 1;
	   else if (n < 0)
	      return -1 * harmonic(-n);
	   else // n > 1
	      return 1.0/n + harmonic (n - 1);
	}
}
