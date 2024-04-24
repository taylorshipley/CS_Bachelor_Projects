using System.Windows;

namespace Assignment6P1
{
    /// <summary>
    /// This class represents a window that allows the user to add a passenger.
    /// </summary>
    public partial class AddPassengerWindow : Window
    {
        /// <summary>
        /// Initializes a new instance of the AddPassengerWindow class.
        /// </summary>
        public AddPassengerWindow()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Handles the Click event of the CancelButton control.
        /// Closes the current window.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event data.</param>
        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            // Close the window when the Cancel button is clicked
            this.Close();
        }

        /// <summary>
        /// Handles the Click event of the SubmitButton control.
        /// Closes the current window.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event data.</param>
        private void SubmitButton_Click(object sender, RoutedEventArgs e)
        {
            // Close the window when the Submit button is clicked
            this.Close();
        }
    }
}
