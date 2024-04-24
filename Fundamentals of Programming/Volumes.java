/*****************************************
* Author: Taylor Shipley
* Date: 03/21/2021
* Assignment: A07 Volumes
 *******************************************/
import java.lang.Math;
public class Volumes 
{
   public static double cuboid(double sideA, double sideB, double sideC)
   {
      double volume = sideA * sideB * sideC;
      return volume;
   }
   public static double cuboid(double side)
   {
      double volume = Math.pow(side, 3);
      return volume;
   }
   
   public static double ellipsoid(double axisA, double axisB, double axisC)
   {
      double volume = (4 * Math.PI * axisA * axisB * axisC) / 3;
      return volume;
   }
   public static double ellipsoid(double axis)
   {
      double volume = (4 * Math.PI * Math.pow(axis, 3)) / 3;
      return volume;
   }
   
   public static double cylinder(double radius, double height)
   {
      double volume = height * Math.PI * Math.pow(radius, 2);
      return volume;
   }
   
   public static double cone(double diameter, double side)
   {
      double radius = diameter / 2;
      double height = Math.sqrt(Math.pow(side, 2) - Math.pow(radius, 2));
      double volume = (Math.PI * Math.pow(radius, 2) * height) / 3;
      return volume;
   }
}