/*****************************************
 * Author : Taylor Shipley
 * Date : 02/16/2021
 * Assignment: Lab: Char
 *******************************************/
public class Main
{
	public static void main(String[] args)
	{
		char dash = '-';
		System.out.printf("Dash: %s%n", dash);
		char a = 'a';
		char letter = a;
		++letter;
		char b = letter;
		++letter;
		char c = letter;
		letter += 2;
		char e = letter;
		System.out.printf("letter:%s a:%s b:%s c:%s e:%s%n", letter, a, b, c, e);
		String copyrightSign = "\u00A9";
		System.out.printf("Copyright sign: %s 169 A9 %n", copyrightSign);
		char yen = '¥';
		System.out.printf("Yen: %s 165 A5 %n", yen);
	}
}
