/*****************************************
 * Author : Taylor Shipley
 * Date : 02/04/2021
 * Assignment: Lab: Employee
 *******************************************/
public class EmployeeTest
{
	public static void main(String[] args)
	{
	   // create an instance of type Employee
	   Employee myEmployee = new Employee("John", "Smith", 1000);
		
		// print the Employee data using get accessors
		System.out.printf("myEmployee name: %s %s\n", 
			myEmployee.getFirstName(), myEmployee.getLastName());
		System.out.printf("myEmployee salary: $%.2f\n", myEmployee.getSalary());
		
		// attempt to change salary to an invalid value
		myEmployee.setSalary(-500);
		System.out.printf("myEmployee salary: $%.2f\n", myEmployee.getSalary());
		
		// change salary and display again
		myEmployee.setSalary(1050);
		System.out.printf("myEmployee salary: $%.2f\n", myEmployee.getSalary());
	}
}