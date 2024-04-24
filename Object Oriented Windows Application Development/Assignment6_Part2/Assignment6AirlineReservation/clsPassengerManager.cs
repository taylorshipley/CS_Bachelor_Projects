using System;
using System.Collections.Generic;
using System.Data;
using System.Windows;
using System.Windows.Media.Media3D;

namespace Assignment6AirlineReservation
{
    class clsPassengerManager
    {
        static readonly clsDataAccess dataAccess = new clsDataAccess();
        static int numPassengers;
        public static List<clsPassenger> Passengers;
        public static List<string> occupiedSeats;
        /// <summary>
        /// Loads the list of passengers for the specified flight from the database.
        /// </summary>
        /// <param name="sFlightID">The ID of the flight for which to load the passengers.</param>
        /// <returns>The list of passengers loaded from the database.</returns>
        public static List<clsPassenger> LoadPassengers(string sFlightID)
        {
            // Initialize the list of passengers and occupied seats
            Passengers = new List<clsPassenger>();
            occupiedSeats = new List<string>();

            // Get the SQL statement to select the passengers for the specified flight ID
            string sqlStatement = clsSQL.GetPassengers(sFlightID);

            // Execute the SQL statement and loop through the results to create new passenger objects
            DataSet ds = dataAccess.ExecuteSQLStatement(sqlStatement, ref numPassengers);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                // Retrieve the values from the row using the column names
                string sPassengerID = ((int)row["Passenger_ID"]).ToString();
                string sFirstName = (string)row["First_Name"];
                string sLastName = (string)row["Last_Name"];
                string sSeatNumber = (string)row["Seat_Number"];

                // Create a new Passenger object using the retrieved values
                clsPassenger passenger = new clsPassenger(sPassengerID, sFirstName, sLastName, sSeatNumber);

                // Add the passenger to the list of passengers
                Passengers.Add(passenger);

                // Marks that passenger's seat as occupied
                occupiedSeats.Add(sSeatNumber);
            }

            // Return the list of passengers
            return Passengers;
        }

        /// <summary>
        /// Inserts a new passenger with the specified first name, last name, and seat number to the specified flight.
        /// </summary>
        /// <param name="sFirstName">The first name of the passenger.</param>
        /// <param name="sLastName">The last name of the passenger.</param>
        /// <param name="sFlightID">The ID of the flight to which the passenger will be assigned.</param>
        /// <param name="sSeatNumber">The seat number to which the passenger will be assigned.</param>
        public static void InsertPassenger(string sFirstName, string sLastName, string sFlightID, string sSeatNumber)
        {
            // Insert new passenger into database
            string sqlStatement = clsSQL.InsertPassenger(sFirstName, sLastName);
            dataAccess.ExecuteNonQuery(sqlStatement);

            // Gets passengerId created by database
            sqlStatement = clsSQL.GetPassengerByName(sFirstName, sLastName);
            string passengerId = dataAccess.ExecuteScalarSQL(sqlStatement);

            // Assigns Passenger to a seat on the specified flight
            sqlStatement = clsSQL.AssignSeat(sFlightID, passengerId, sSeatNumber);
            dataAccess.ExecuteNonQuery(sqlStatement);
        }

        /// <summary>
        /// Deletes a passenger from a flight.
        /// </summary>
        /// <param name="SelectedPassenger">The passenger to be deleted.</param>
        /// <param name="SelectedFlight">The flight the passenger is on.</param>
        internal static void DeletePassenger(clsPassenger SelectedPassenger, clsFlight SelectedFlight)
        {
            // Deletes the link between the passenger and the flight
            string sqlStatement = clsSQL.DeleteLink(SelectedFlight.sFlightID, SelectedPassenger.sPassengerID);
            dataAccess.ExecuteNonQuery(sqlStatement);

            // Deletes the passenger from the database
            sqlStatement = clsSQL.DeletePassenger(SelectedPassenger.sPassengerID);
            dataAccess.ExecuteNonQuery(sqlStatement);
        }

        /// <summary>
        /// Changes the seat number of a passenger on a flight.
        /// </summary>
        /// <param name="SelectedPassenger">The passenger to update.</param>
        /// <param name="SelectedFlight">The flight the passenger is on.</param>
        /// <param name="sSeatNumber">The new seat number to assign to the passenger.</param>
        internal static void ChangePassengerSeat(clsPassenger SelectedPassenger, clsFlight SelectedFlight, string sSeatNumber)
        {
            // Updates the seat number for the selected passenger on the selected flight
            string sqlStatement = clsSQL.UpdateSeat(SelectedPassenger.sPassengerID, SelectedFlight.sFlightID, sSeatNumber);
            dataAccess.ExecuteNonQuery(sqlStatement);
        }

    }
}
