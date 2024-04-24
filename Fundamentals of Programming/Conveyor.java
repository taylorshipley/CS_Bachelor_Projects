/*****************************************
 * Author : Taylor Shipley
 * Date : 02/04/2021
 * Assignment: A04 Conveyor
 *******************************************/
 
public class Conveyor
{
   String conveyorType;
	double conveyorSpeed; //Speed is measured in m/s (meters per second)
	double conveyorTime;
   public Conveyor(String type, double speed)
   {
      conveyorType = type;
      conveyorSpeed = speed;
      if (conveyorSpeed < 0)
         {
            conveyorSpeed = 0;
         }
   }
   
   public String getType( ) 
   {
      return conveyorType;
   }
   
   public double getSpeed( ) 
   {
      return conveyorSpeed;
   }
   
   public void setSpeed( double speed) 
   {
      if (speed >= 0)
      {
         conveyorSpeed = speed;
         System.out.println("... updating speed");
         System.out.println();
      }
   }
   
   public double timeToTransport(double distance)
   {
      if (conveyorSpeed > 0)
      {
         conveyorTime = distance / conveyorSpeed;
         conveyorTime = Math.round(conveyorTime * 10d) / 10d;
         return conveyorTime;
      }
      else
      {
         conveyorTime = distance / conveyorSpeed;
         return conveyorTime;
      }
   }
}