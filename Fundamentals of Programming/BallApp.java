/*****************************************
 * Author : Taylor Shipley
 * Date : 02/15/2021
 * Assignment: Lab: Ball
 *******************************************/
public class BallApp
{
	public static void main(String[] args)
	{
	   // create an instance of type Ball
	   Ball myBall = new Ball(5);
		
		// print the Ball data using get accessors
		System.out.printf("Ball with size %.1f\n", myBall.getSize());
		
		// roll the ball
		myBall.roll();
		
		//bounce the ball (x) times
		myBall.bounce(14);
		
		// change size and display again
		myBall.setSize(7);
		System.out.printf("Size %.1f\n", myBall.getSize());
	}
}