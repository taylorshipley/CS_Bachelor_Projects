/******************************************************************************

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

*******************************************************************************/
import java.util.Scanner;  // Import the Scanner class

class Main {
  public static void main(String[] args) {
    Scanner input = new Scanner(System.in);  
    
    System.out.println("What is your favorite number?");
    String favNumString = input.nextLine();
    int favNum = Integer.parseInt(favNumString);
    
    System.out.println("What is your age?");
    String ageString = input.nextLine();
    int age = Integer.parseInt(ageString);
    
    System.out.println("What is your name");
    String name = input.nextLine();  
    
    System.out.printf("%s your favorite number is %d and you are %d years old", name, favNum, age);
      
  }
  
}
