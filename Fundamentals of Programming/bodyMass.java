/*****************************************
 * Author : Taylor Shipley
 * Date : 02/02/2021
 * Assignment: Lab – Body Mass
 *******************************************/
import java.util.Scanner;

public class bodyMass
{
    public static void main(String[] args) 
    {
        Scanner input = new Scanner(System.in);
		System.out.print("Weight (lbs): ");
		double weight= input.nextInt();
		input.nextLine();
		System.out.print("Height (in): ");
		double height= input.nextInt();
		input.nextLine();
		double bmi=(703*weight)/(height*height);
		bmi= (double)Math.round(bmi * 10d) / 10d;
		
		if (bmi <18.5)
		{
		    System.out.println("BMI: " + bmi + "\t Underweight");
		}
		else if (bmi >= 18.5 && bmi< 25)
		{
		    System.out.println("BMI: " + bmi + "\t Just right");
		}
		else if (bmi >= 25 && bmi< 30)
		{
		    System.out.println("BMI: " + bmi + "\t Overweight");
		}
		else if (bmi >=30)
		{
		    System.out.println("BMI: " + bmi + "\t Obese");
		}
    }
}
