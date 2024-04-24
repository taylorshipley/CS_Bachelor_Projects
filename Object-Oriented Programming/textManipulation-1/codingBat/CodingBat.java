/**
 * @author Taylor Shipley
 */

package codingBat;


/**
 * The Class CodingBat.
 */
public class CodingBat 
{
	
	/**
	 * wordEnds takes in and compares 2 Strings.
	 * If Strings have the same letters in the same position, a new string is created using the letters just before and after the matching section.
	 *
	 * @param str 	The first String
	 * @param word 	The second String
	 * @return The newly created String
	 */
	public static String wordEnds(String str, String word)
	{
		int strLength = str.length();
		int wordLength = word.length();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < (strLength - wordLength + 1); i++)
		{ 
			String temp = str.substring(i,i+wordLength);
			if (i > 0 && temp.equals(word))
			{
				sb.append(str.substring(i-1,i));
			}
			if (i < strLength-wordLength && temp.equals(word))
			{
				sb.append(str.substring(i+wordLength,i + wordLength + 1));
			}
		}
		String updatedStr = sb.toString();
		return updatedStr;
	}
}
