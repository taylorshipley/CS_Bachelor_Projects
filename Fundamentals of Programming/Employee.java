public class Employee
{
   // fields
   private String firstName;
	private String lastName;
	private double salary;
	
	// constructors
	public Employee(String fname, String lname, double s1)
   {
      firstName = fname;
      lastName = lname;
      salary = s1;
   }
 
   // methods
   
      //getters
   public String getFirstName() 
   {
      return firstName;
   }
   public String getLastName() 
   {
      return lastName;
   }
   public double getSalary() 
   {
      return salary;
   }
   
      //setters
   public void setSalary( double s2) 
   {
      if (s2 >= 0)
      {
         salary = s2;
      }
   }
}