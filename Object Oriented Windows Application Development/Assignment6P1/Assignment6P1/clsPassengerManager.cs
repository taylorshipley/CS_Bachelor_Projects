using System;
using System.Collections.Generic;
using System.Data;

namespace Assignment6P1
{
    internal class clsPassengerManager
    {
        clsSQL sqlHelper = new clsSQL();
        clsDataAccess dataAccess = new clsDataAccess();
        int numPassengers;
        public static List<clsPassenger> passengers = new List<clsPassenger>();
        public static List<String> occupiedSeats = new List<String>();
        public clsPassengerManager(String sFlightID) 
        {
            string sqlStatement = clsSQL.GetPassengers(sFlightID);

            // Loop through, create new Passenger for each row
            DataSet ds = dataAccess.ExecuteSQLStatement(sqlStatement, ref numPassengers);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                // Retrieve the values from the row using the column names
                String sPassengerID = (String)row["Passenger_ID"];
                String sFirstName = (String)row["First_Name"];
                String sLastName = (String)row["Last_Name"];
                String sSeatNumber = (String)row["Seat_Number"];
                
                // Create a new Passenger object using the retrieved values
                clsPassenger passenger = new clsPassenger(sPassengerID,sFirstName, sLastName, sSeatNumber);

                // Marks that passengers seat as occupied
                occupiedSeats.Add(sSeatNumber);

                // Add the new Passenger object to the list of passengers
                passengers.Add(passenger);
            }
        }
    }
}
