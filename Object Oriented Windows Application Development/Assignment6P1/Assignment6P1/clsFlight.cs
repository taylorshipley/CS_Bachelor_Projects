using System;

namespace Assignment6P1
{
    /// <summary>
    /// Represents a flight with a unique identifier, flight number, and aircraft type.
    /// </summary>
    class clsFlight
    {
        /// <summary>
        /// Gets or sets the unique identifier of the flight.
        /// </summary>
        public String sFlightID { get; set; } // Property that gets or sets the unique identifier of the flight

        /// <summary>
        /// Gets or sets the flight number of the flight.
        /// </summary>
        public String sFlightNumber { get; set; } // Property that gets or sets the flight number of the flight

        /// <summary>
        /// Gets or sets the aircraft type of the flight.
        /// </summary>
        public String sAircraftType { get; set; } // Property that gets or sets the aircraft type of the flight

        /// <summary>
        /// Initializes a new instance of the <see cref="clsFlight"/> class with the specified flight ID, flight number, and aircraft type.
        /// </summary>
        /// <param name="sFlightID">The unique identifier of the flight.</param>
        /// <param name="sFlightNumber">The flight number of the flight.</param>
        /// <param name="sAircraftType">The aircraft type of the flight.</param>
        public clsFlight(String sFlightID, String sFlightNumber, String sAircraftType)
        {
            // Constructor that sets the properties of the clsFlight object with the specified values
            this.sFlightID = sFlightID;
            this.sFlightNumber = sFlightNumber;
            this.sAircraftType = sAircraftType;
        }

        /// <summary>
        /// Returns a string that represents the current object.
        /// </summary>
        /// <returns>A string that represents the current object.</returns>
        public override string ToString()
        {
            // Returns a string representation of the clsFlight object with its properties
            return "FlightID: " + sFlightID + " " + "FlightNumber: " + sFlightNumber + " " + "AircraftType: " + sAircraftType;
        }
    }
}
