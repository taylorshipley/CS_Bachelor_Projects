namespace Assignment6AirlineReservation
{
    /// <summary>
    /// Represents a passenger on a flight.
    /// </summary>
    class clsPassenger
    {
        /// <summary>
        /// Gets or sets the passenger ID.
        /// </summary>
        public string sPassengerID { get; set; }

        /// <summary>
        /// Gets or sets the passenger's first name.
        /// </summary>
        public string sFirstName { get; set; }

        /// <summary>
        /// Gets or sets the passenger's last name.
        /// </summary>
        public string sLastName { get; set; }

        /// <summary>
        /// Gets or sets the passenger's seat number.
        /// </summary>
        public string sSeatNumber { get; set; }

        /// <summary>
        /// Gets or sets the passenger's fullname.
        /// </summary>
        public string sFullName { get; set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="clsPassenger"/> class.
        /// </summary>
        /// <param name="sPassengerID">The passenger ID.</param>
        /// <param name="sFirstName">The passenger's first name.</param>
        /// <param name="sLastName">The passenger's last name.</param>
        /// <param name="sSeatNumber">The passenger's seat number.</param>
        public clsPassenger(string sPassengerID, string sFirstName, string sLastName, string sSeatNumber)
        {
            // Initializing the member variables with the constructor parameters
            this.sPassengerID = sPassengerID;
            this.sFirstName = sFirstName;
            this.sLastName = sLastName;
            this.sSeatNumber = sSeatNumber;
            sFullName = sFirstName + " " + sLastName;
        }

        /// <summary>
        /// Returns a string representation of the <see cref="clsPassenger"/> object.
        /// </summary>
        /// <returns>A string that represents the <see cref="clsPassenger"/> object.</returns>
        public override string ToString()
        {
            // Returning a string that contains the passenger ID, first name, and last name
            return "PassengerID: " + sPassengerID + " FirstName: " + sFirstName + " Lastname: " + sLastName;
        }
    }
}