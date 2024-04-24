using System;
using System.Reflection;
using System.Windows;
using System.Xml.Linq;

namespace Assignment6AirlineReservation
{
    /// <summary>
    /// Provides methods to generate SQL statements.
    /// </summary>
    internal class clsSQL
    {
        /// <summary>
        /// Gets the SQL statement to retrieve all Flights.
        /// </summary>
        /// <returns>The SQL statement to retrieve all Flights.</returns>
        public static string GetFlights()
        {
            try
            {
                // SQL statement to select all flight IDs, flight numbers and aircraft types
                string sSql = "SELECT Flight_ID, Flight_Number, Aircraft_Type FROM Flight";

                // Return the SQL statement
                return sSql;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw a new exception with the name of the current class and method and the error message
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }


        /// <summary>
        /// Gets the SQL statement to retrieve all passengers for a given flight.
        /// </summary>
        /// <param name="sFlightID">The ID of the flight to retrieve passengers for.</param>
        /// <returns>The SQL statement to retrieve all passengers for the given flight.</returns>
        public static string GetPassengers(string sFlightID)
        {
            try
            {
                // SQL statement to select passenger ID, first name, last name and seat number for all passengers on the given flight ID
                string sSQL = "SELECT PASSENGER.Passenger_ID, First_Name, Last_Name, Seat_Number " +
                    "FROM FLIGHT_PASSENGER_LINK, FLIGHT, PASSENGER " +
                    "WHERE FLIGHT.FLIGHT_ID = FLIGHT_PASSENGER_LINK.FLIGHT_ID AND " +
                    "FLIGHT_PASSENGER_LINK.PASSENGER_ID = PASSENGER.PASSENGER_ID AND " +
                    "FLIGHT.FLIGHT_ID = " + sFlightID;

                // Return the SQL statement
                return sSQL;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw a new exception with the name of the current class and method and the error message
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }


        /// <summary>
        /// Generates a SQL DELETE statement for deleting a passenger with the specified ID.
        /// </summary>
        /// <param name="sPassengerID">The ID of the passenger to be deleted.</param>
        /// <returns>A string containing a SQL DELETE statement.</returns>
        public static string DeletePassenger(string sPassengerID)
        {
            try
            {
                string sSQL = "DELETE FROM PASSENGER WHERE PASSENGER_ID = " + sPassengerID;
                return sSQL;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw an exception with the name of the current class and method and the error message
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }

        /// <summary>
        /// Generates a SQL INSERT statement for adding a passenger with the specified first and last names.
        /// </summary>
        /// <param name="sFirstName">The first name of the passenger to be added.</param>
        /// <param name="sLastName">The last name of the passenger to be added.</param>
        /// <returns>A string containing a SQL INSERT statement.</returns>
        public static string InsertPassenger(string sFirstName, string sLastName)
        {
            try
            {
                string sSQL = "INSERT INTO PASSENGER(First_Name, Last_Name) VALUES('" + sFirstName + "','" + sLastName + "')";
                return sSQL;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw an exception with the name of the current class and method and the error message
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }

        /// <summary>
        /// Generates a SQL SELECT statement for retrieving the ID of a passenger with the specified first and last names.
        /// </summary>
        /// <param name="sFirstName">The first name of the passenger to search for.</param>
        /// <param name="sLastName">The last name of the passenger to search for.</param>
        /// <returns>A string containing a SQL SELECT statement.</returns>
        public static string GetPassengerByName(string sFirstName, string sLastName)
        {
            try
            {
                string sSQL = "SELECT Passenger_ID from Passenger where First_Name = '" + sFirstName + "' AND Last_Name = '" + sLastName + "'";
                return sSQL;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw an exception with the name of the current class and method and the error message
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }

        /// <summary>
        /// Generates a SQL UPDATE statement for changing the seat of a passenger on a flight.
        /// </summary>
        /// <param name="sSeatNumber">The new seat number for the passenger.</param>
        /// <param name="sFlightId">The ID of the flight the passenger is on.</param>
        /// <param name="sPassengerId">The ID of the passenger whose seat is being changed.</param>
        /// <returns>A string containing a SQL UPDATE statement.</returns>
        public static string ChangeSeat(string sSeatNumber, string sFlightId, string sPassengerId)
        {
            try
            {
                string sSQL = "UPDATE FLIGHT_PASSENGER_LINK SET Seat_Number = '" + sSeatNumber
                    + "' WHERE FLIGHT_ID = " + sFlightId + " AND PASSENGER_ID = " + sPassengerId;
                return sSQL;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw an exception with the name of the current class and method and the error message
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }

        /// <summary>
        /// Generates a SQL INSERT statement for assigning a seat to a passenger on a flight.
        /// </summary>
        /// <param name="sFlightId">The ID of the flight the passenger is on.</param>
        /// <param name="sPassengerId">The ID of the passenger whose seat is being assigned.</param>
        /// <param name="sSeatNumber">The seat number being assigned to the passenger.</param>
        /// <returns>A string containing a SQL INSERT statement.</returns>
        public static string AssignSeat(string sFlightId, string sPassengerId, string sSeatNumber)
        {
            try
            {
                string sSQL = "INSERT INTO Flight_Passenger_Link(Flight_ID, Passenger_ID, Seat_Number) " + "VALUES( " + sFlightId + ", " + sPassengerId + ", " + sSeatNumber + ")";
                return sSQL;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw an exception with the name of the current class and method and the error message
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }

        /// <summary>
        /// Generates a SQL DELETE statement for removing a link between a passenger and a flight.
        /// </summary>
        /// <param name="sFlightId">The ID of the flight the link is being removed from.</param>
        /// <param name="sPassengerId">The ID of the passenger the link is being removed from.</param>
        /// <returns>A string containing a SQL DELETE statement.</returns>
        public static string DeleteLink(string sFlightId, string sPassengerId)
        {
            try
            {
                string sSQL = "DELETE FROM FLIGHT_PASSENGER_LINK WHERE FLIGHT_ID =" + sFlightId + " AND PASSENGER_ID = " + sPassengerId;
                return sSQL;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw an exception with the name of the current class and method and the error message
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }

        /// <summary>
        /// Generates a SQL statement to update the seat number for a given passenger on a given flight.
        /// </summary>
        /// <param name="sPassengerID">The ID of the passenger to update.</param>
        /// <param name="selectedFlightID">The ID of the flight to update the passenger's seat on.</param>
        /// <param name="sSeatNumber">The new seat number to assign to the passenger.</param>
        /// <returns>A string containing the SQL statement to update the passenger's seat.</returns>
        internal static string UpdateSeat(string sPassengerID, string selectedFlightID, string sSeatNumber)
        {
            string sSQL = "UPDATE FLIGHT_PASSENGER_LINK SET Seat_Number = '" + sSeatNumber + "' WHERE FLIGHT_ID = " + selectedFlightID + " AND PASSENGER_ID = " + sPassengerID;
            return sSQL;
        }
    }
}
