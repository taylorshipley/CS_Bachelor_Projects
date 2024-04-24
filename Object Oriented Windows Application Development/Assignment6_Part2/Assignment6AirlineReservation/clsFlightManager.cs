using System.Collections.Generic;
using System.Data;

namespace Assignment6AirlineReservation
{
    /// <summary>
    /// Manages the Flights in the system.
    /// </summary>
    class clsFlightManager
    {
        private static clsSQL clsSQL = new clsSQL(); // Object to handle SQL statements
        static readonly clsDataAccess DataAccess = new clsDataAccess(); // Object to handle data access
        public static List<clsFlight> Flights = new List<clsFlight>(); // List of all the loaded flight numbers cast as string

        /// <summary>
        /// Loads the list of flights from the database.
        /// </summary>
        /// <returns>The list of flights loaded from the database.</returns>
        public static List<clsFlight> LoadFlights()
        {
            int numFlights = 0;
            List<string> FlightNum = new List<string>();

            // Get the SQL statement to retrieve flights
            string sqlStatement = clsSQL.GetFlights();

            // Execute the SQL statement and get the dataset
            DataSet ds = DataAccess.ExecuteSQLStatement(sqlStatement, ref numFlights);

            // Loop through each row in the dataset and create a new Flight object for each one
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                // Retrieve the values from the row using the column names
                string sFlightID = ((int)row["Flight_ID"]).ToString(); // The unique identifier of the flight
                string sFlightNumber = (string)row["Flight_Number"]; // The flight number
                string sAircraftType = (string)row["Aircraft_Type"]; // The type of aircraft

                // Create a new Flight object using the retrieved values
                clsFlight flight = new clsFlight(sFlightID, sFlightNumber, sAircraftType);

                // Add the new Flight object to the list of Flights
                Flights.Add(flight);
                FlightNum.Add(sFlightNumber);
            }

            // Return the list of Flights
            return Flights;
        }

        /// <summary>
        /// Gets the ID of a flight based on its flight number.
        /// </summary>
        /// <param name="selectedFlightNum">The flight number of the selected flight.</param>
        /// <returns>The ID of the selected flight.</returns>
        internal static string GetFlightID(string selectedFlightNum)
        {
            string flightID = "";

            // Loop through each flight in the list of Flights
            foreach (clsFlight flight in Flights)
            {
                if (flight.sFlightNumber == selectedFlightNum)
                {
                    // If the flight number matches the selected flight number, set the flight ID and return it
                    flightID = flight.sFlightID;
                    return flightID;
                }
            }

            // If no matching flight is found, return an empty string
            return flightID;
        }
    }
}
