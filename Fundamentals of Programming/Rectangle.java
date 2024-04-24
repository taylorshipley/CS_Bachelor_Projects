public class Rectangle
{
	// private field(s)
	private int length;
	private int width;
	
   // constructor(s)
	public Rectangle (int l, int w)
	{
		setLength(l);
		setWidth(w);
	}
	
	// public method(s)
	
	public int getLength()
	{
		return length;
	}
	
	public int getWidth()
	{
		return width;
	}
	
	public void setLength(int newLength)
	{
		if (newLength >= 0)
			length = newLength;
	}

	public void setWidth(int newWidth)
	{
		if (newWidth >= 0)
			width = newWidth;
	}
	
	public int area()
	{
		return length * width;
	}
	
	public int perimeter()
	{
		return (length + width) * 2;
	}
}