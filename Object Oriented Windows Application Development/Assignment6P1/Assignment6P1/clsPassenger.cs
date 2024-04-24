using System;

namespace Assignment6P1
{
    /// <summary>
    /// Represents a passenger on a flight.
    /// </summary>
    class clsPassenger
    {
        /// <summary>
        /// Gets or sets the passenger ID.
        /// </summary>
        public String sPassengerID { get; set; }

        /// <summary>
        /// Gets or sets the passenger's first name.
        /// </summary>
        public String sFirstName { get; set; }

        /// <summary>
        /// Gets or sets the passenger's last name.
        /// </summary>
        public String sLastName { get; set; }

        /// <summary>
        /// Gets or sets the passenger's seat number.
        /// </summary>
        public String sSeatNumber { get; set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="clsPassenger"/> class.
        /// </summary>
        /// <param name="sPassengerID">The passenger ID.</param>
        /// <param name="sFirstName">The passenger's first name.</param>
        /// <param name="sLastName">The passenger's last name.</param>
        /// <param name="sSeatNumber">The passenger's seat number.</param>
        public clsPassenger(String sPassengerID, String sFirstName, String sLastName, String sSeatNumber)
        {
            // Initializing the member variables with the constructor parameters
            this.sPassengerID = sPassengerID;
            this.sFirstName = sFirstName;
            this.sLastName = sLastName;
            this.sSeatNumber = sSeatNumber;
        }

        /// <summary>
        /// Returns a string representation of the <see cref="clsPassenger"/> object.
        /// </summary>
        /// <returns>A string that represents the <see cref="clsPassenger"/> object.</returns>
        public override string ToString()
        {
            // Returning a string that contains the passenger ID, first name, and last name
            return "PassengerID: " + sPassengerID + " " + "FirstName" + sFirstName + " " + "Lastname" + sLastName;
        }
    }
}