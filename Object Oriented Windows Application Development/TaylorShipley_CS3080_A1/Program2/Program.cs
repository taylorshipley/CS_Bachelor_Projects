using System;


/// <summary>
/// Calculator class contains Main method to perform arithmetic operations and comparison operations
/// </summary>
class Calculator
{
    /// <summary>
    /// Main method takes input from the user, performs arithmetic and comparison operations and prints the result
    /// </summary>
    /// <param name="args"></param>
    static void Main(string[] args)
    {
        Console.Write("Enter first number: ");
        int num1 = int.Parse(Console.ReadLine());
        Console.Write("Enter second number: ");
        int num2 = int.Parse(Console.ReadLine());

        /// <summary>
        /// Perform addition operation
        /// </summary>
        Console.WriteLine("Addition: " + num1 + " + "  +num2 + " = " + (num1 + num2));

        /// <summary>
        /// Perform subtraction operation
        /// </summary>
        Console.WriteLine("Subtraction: " + num1 + " - " + num2 + " = " + (num1 - num2));

        /// <summary>
        /// Perform multiplication operation
        /// </summary>
        Console.WriteLine("Multiplication: " + num1 + " x "  + num2 + " = " + (num1 * num2));

        /// <summary>
        /// Perform division operation
        /// </summary>
        Console.WriteLine("Division: " + num1 + " / " + num2 + " = " + (num1 / num2));

        /// <summary>
        /// Perform remainder operation
        /// </summary>
        Console.WriteLine("Remainder:  " + num1 + " % " + num2 + " = " + (num1 % num2));

        /// <summary>
        /// Perform comparison operations and prints results to console.
        /// </summary>
        if (num1 < num2)
        {
            Console.WriteLine(num1 +" is less than " + num2);
            Console.WriteLine(num1 + " is not greater than " + num2);
            Console.WriteLine(num1 + " is not equal to " + num2);
        }
        else if (num1 > num2)
        {
            Console.WriteLine(num1 + " is not less than " + num2);
            Console.WriteLine(num1 +" is greater than " + num2);
            Console.WriteLine(num1 + " is not equal to " + num2);
        }
        else
        {
            Console.WriteLine(num1 + " is not less than " + num2);
            Console.WriteLine(num1 + " is not greater than " + num2);
            Console.WriteLine(num1 + " is equal to " + num2);
        }
    }
}
