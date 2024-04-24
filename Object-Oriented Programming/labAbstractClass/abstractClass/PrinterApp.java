package abstractClass;


/**
 * @author Taylor Shipley
 * App used to test Superclass printer and it's Subclasses.
 */
public class PrinterApp 
{

	public static void main(String[] args) 
	{
		Printer[] printers = new Printer[2];
		InkjetPrinter myPrinter1 = new InkjetPrinter("Canon TS202");
		LaserPrinter myPrinter2 = new LaserPrinter("Samsung Xpress");
		printers[0] = myPrinter1;
		printers[1] = myPrinter2;
		
		for (Printer i: printers)
		{
			System.out.println(i.toString());
			for (int t = 0; t < 12; t++)
			{
				i.print();
			}
			System.out.println();
		}
		myPrinter1.refillCartridge();
		myPrinter2.refillToner();
		
		System.out.println("Remaining cartridge after refilling: " + myPrinter1.getRemainingCartridge() + "%");
		System.out.println("Remaining toner after refilling: " + myPrinter2.getRemainingToner() + "%");
	}
}
