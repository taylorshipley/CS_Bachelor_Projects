public class Country
{
	// fields
	private final String name;
	private final Continent continent;
	// constructor
	public Country(String name1, Continent continent1)
   {
      name = name1;
      continent = continent1;
   }
	// methods
	public String getName()
	{
	   return name;
	}
	public Continent getContinent()
	{
	   return continent;
	}
	@Override
	public String toString()
	{
		return String.format("%s (%s)", name, continent);
	}
}