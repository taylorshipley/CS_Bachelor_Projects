/*****************************************
 * Author : Taylor Shipley
 * Date : 02/04/2021
 * Assignment: A04 Conveyor
 *******************************************/
public class ConveyorApp
{
   public static void main(String []args)
   {
      int conveyorLength = 50;
      System.out.print("Conveyor1: ");
      Conveyor flatConveyor = new Conveyor("flat belt", 0.9);
      
      System.out.println(flatConveyor.getType() + " conveyor with a speed of " + flatConveyor.getSpeed() + " m/s");
      System.out.println("Time to transport an item "+ conveyorLength + " m: " + flatConveyor.timeToTransport(conveyorLength) + " s");
      System.out.println();
      
      System.out.print("Conveyor2: ");
      Conveyor rollerConveyor = new Conveyor( "roller", -0.5);
      
      System.out.println(rollerConveyor.getType() + " conveyor with a speed of " + rollerConveyor.getSpeed() + " m/s");
      System.out.println("Time to transport an item "+ conveyorLength + " m: " + rollerConveyor.timeToTransport(conveyorLength) + " s");
      System.out.println();
      
      flatConveyor.setSpeed(-3);
      rollerConveyor.setSpeed(0.4);
      
      System.out.println(rollerConveyor.getType() + " conveyor with a speed of " + rollerConveyor.getSpeed() + " m/s");
      System.out.println("Time to transport an item "+ conveyorLength + " m: " + rollerConveyor.timeToTransport(conveyorLength) + " s");
      System.out.println();
      
      System.out.println(flatConveyor.getType() + " conveyor with a speed of " + flatConveyor.getSpeed() + " m/s");
      System.out.println("Time to transport an item "+ conveyorLength + " m: " + flatConveyor.timeToTransport(conveyorLength) + " s");
      System.out.println();
   }
}