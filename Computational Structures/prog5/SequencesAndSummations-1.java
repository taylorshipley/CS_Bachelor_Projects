/**
 * @Author: Taylor Shipley
 * @Class: CS2130
 * @Program: 5
 * @Name:Sequences and Summations
 * @Desc: Find a specific Fibonacci number and verify a summation formula
 * @Version:  1.0
 * @Date: 10/09/2022
 */
package prog5;

import java.util.Scanner;

public class SequencesAndSummations {

	public static void main(String[] args) {
		//Asks user to enter a number to find that term of the fibonacci sequence
		Scanner input = new Scanner(System.in);
		System.out.print("What Nth term of the fibonacci sequence do you want to know?  n=");
		int n = input.nextInt();
		input.nextLine();
		int fiboN = fibo(n);
		System.out.println("The term " +n +" of the fibonacci sequence is " +fiboN);
		
		//Asks user to enter another number
		System.out.print("\nEnter another number, t: ");
		int t= input.nextInt();
		input.nextLine();
		// Finds the summation of the range between t to 1 and prints it out
		int sumRangeT = sumRange(t);
		System.out.println("The sum of all the integers from " + t + " to 1 = " +sumRangeT);
		
		//Calculates ƒ(t) and prints t out
		int funcT= t*(t+1)/2;
		System.out.println("If ƒ(t)=t(t+1)/2 then ƒ("+t+")=" + funcT);
		// Tests if the Σ of t to 1 is equal to ƒ(t) then informs user via print message
		if(sumRangeT == funcT){
			System.out.println("ƒ("+t+") is the same as the Σ 1 to " + t);
		} else{
			System.out.println("ƒ("+t+") is not the same as the Σ 1 to " + t);
		}
		input.close();
	}

	/**
	 * Uses recursion to find the nth term of the fibanocci
	 * 
	 * @param n The term of the sequence to find
	 * @return The value of the element at the nth term
	 */
	
	public static int fibo(int n) {
		if (n < 2) {
			return n;
		} else {
			return fibo(n - 1) + fibo(n - 2);
		}
	}
	/**
	 * @param val1 The first number for the range
	 * @return Sum of the range of integers between val1 and val2
	 */
	public static int sumRange(int val1) {
		//Sorts val1 and val2 by largest to smallest
		if (val1 <= 0) {
			return val1;
		}
		return val1 + sumRange(val1 - 1);
	}
}
