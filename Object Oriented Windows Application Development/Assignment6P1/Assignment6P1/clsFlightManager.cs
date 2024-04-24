using System;
using System.Collections.Generic;
using System.Data;

namespace Assignment6P1
{
    /// <summary>
    /// Manages the flights in the system.
    /// </summary>
    class clsFlightManager
    {
        private clsSQL clsSQL = new clsSQL(); // Object to handle SQL statements
        private clsDataAccess clsDataAccess = new clsDataAccess(); // Object to handle data access
        private int numFlights = 0; // Number of flights retrieved
        public static List<clsFlight> Flights { get; set; } // List of flights in the system

        /// <summary>
        /// Initializes a new instance of the clsFlightManager class.
        /// </summary>
        public clsFlightManager()
        {
            string sqlStatement = clsSQL.GetFlights(); // Get the SQL statement to retrieve flights

            // Execute the SQL statement and get the dataset
            DataSet ds = clsDataAccess.ExecuteSQLStatement(sqlStatement, ref numFlights);

            Flights = new List<clsFlight>(); // Create a new list to hold flights

            // Loop through each row in the dataset and create a new Flight object for each one
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                // Retrieve the values from the row using the column names
                String sFlightID = (String)row["Flight_ID"]; // The unique identifier of the flight
                string sFlightNumber = (string)row["Flight_Number"]; // The flight number
                string sAircraftType = (string)row["Aircraft_Type"]; // The type of aircraft

                // Create a new Flight object using the retrieved values
                clsFlight flight = new clsFlight(sFlightID, sFlightNumber, sAircraftType);

                // Add the new Flight object to the list of Flights
                Flights.Add(flight);
            }
        }
    }
}
