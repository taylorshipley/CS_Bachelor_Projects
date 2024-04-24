using System;
using System.Reflection;

namespace Assignment6P1
{
    /// <summary>
    /// Provides methods to generate SQL statements.
    /// </summary>
    internal class clsSQL
    {
        /// <summary>
        /// Gets the SQL statement to retrieve all flights.
        /// </summary>
        /// <returns>The SQL statement to retrieve all flights.</returns>
        public static string GetFlights()
        {
            try
            {
                // SQL statement to select all flight IDs, flight numbers and aircraft types
                string sSql = "SELECT Flight_ID, Flight_Number, Aircraft_Type FROM Flight";
                return sSql;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw an exception with the name of the current class and method and the error message
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

                return sSQL;
            }
            catch (Exception ex)
            {
                // If an exception occurs, throw an exception with the name of the current class and method and the error message
                throw new Exception(MethodInfo.GetCurrentMethod().DeclaringType.Name + "." +
                    MethodInfo.GetCurrentMethod().Name + " -> " + ex.Message);
            }
        }
    }
}
