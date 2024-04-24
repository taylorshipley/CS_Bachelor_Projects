using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Reflection;

namespace Assignment6P1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        clsFlight clsSelectedFlight;
        clsPassenger clsSelectedPassenger;
        clsPassengerManager clsPassengerManager;

        // This is the constructor for the MainWindow class.
        public MainWindow()
        {
            try
            {
                // Initialize the MainWindow component.
                InitializeComponent();

                // Set the shutdown mode to OnMainWindowClose.
                Application.Current.ShutdownMode = ShutdownMode.OnMainWindowClose;

                // Create a new instance of the clsFlightManager class.
                clsFlightManager clsFlightManager = new clsFlightManager();

                // Set the ItemsSource property of the cbChooseFlight ComboBox to the list of flights retrieved from the clsFlightManager instance.
                cbChooseFlight.ItemsSource = clsFlightManager.Flights;
            }
            catch (Exception ex)
            {
                // If an exception occurs, call the HandleError method with the name of the declaring type, current method, and the error message.
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }

        /// <summary>
        /// Handles errors by printing the Declaring Type, Current Method, and message to the console.
        /// </summary>
        /// <param name="DeclaringType">The name of the declaring type.</param>
        /// <param name="CurrentMethod">The name of the current method.</param>
        /// <param name="message">The error message.</param>
        private void HandleError(string DeclaringType, string CurrentMethod, string message)
        {
            // Write the declaring type, current method, and error message to the console.
            Console.WriteLine("Declaring Type: " + DeclaringType + "Current Method: " + CurrentMethod + "message: " + message);
        }
        // Event handler for the Add Passenger button click event
        private void AddPassengerButton_Click(object sender, RoutedEventArgs e)
        {
            // Create a new instance of the AddPassengerWindow class
            AddPassengerWindow addPassengerWindow = new AddPassengerWindow();

            // Display the window as a dialog
            addPassengerWindow.ShowDialog();
        }

        /// <summary>
        /// Event handler for when the user selects a flight from the dropdown menu.
        /// </summary>
        /// <param name="sender">The sender object.</param>
        /// <param name="e">The selection changed event arguments.</param>
        private void cbChooseFlight_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                // Get the selected flight from the dropdown menu
                clsSelectedFlight = (clsFlight)cbChooseFlight.SelectedItem;

                // Create a new instance of the clsPassengerManager class with the selected flight ID
                clsPassengerManager = new clsPassengerManager(clsSelectedFlight.sFlightID);

                // Load the selected flight
                LoadFlight();
            }
            catch (Exception ex)
            {
                // If an exception occurs, call the HandleError method with the name of the declaring type, current method, and the error message.
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }

        /// <summary>
        /// Event handler for when the user selects a passenger from the dropdown menu.
        /// </summary>
        /// <param name="sender">The sender object.</param>
        /// <param name="e">The selection changed event arguments.</param>
        private void cbChoosePassenger_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                // Casts the selected item from the dropdown menu to the 'clsPassenger' class and assigns it to the 'clsSelectedPassenger' variable.
                clsSelectedPassenger = (clsPassenger)cbChoosePassenger.SelectedItem;

                // Enables the 'btChangeSeat' and 'btDeletePassenger' buttons.
                btChangeSeat.IsEnabled = true;
                btDeletePassenger.IsEnabled = true;
            }
            catch (Exception ex)
            {
                // Handles any exceptions that occur and logs the error message with the 'HandleError' method.
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }

        /// <summary>
        /// Loads the flight data and populates the UI elements.
        /// </summary>
        private void LoadFlight()
        {
            // Sets the flight number label to the selected flight's flight number.
            lbFlightNum.Content = clsSelectedFlight.sFlightNumber;

            // Enables the 'cbChooseFlight' and 'btAddPassenger' buttons, and makes the seat grid visible.
            cbChooseFlight.IsEnabled = true;
            btAddPassenger.IsEnabled = true;
            gdSeats.Visibility = Visibility.Visible;

            // Enables all buttons in the seat grid.
            foreach (UIElement element in gdSeats.Children)
            {
                if (element is Button)
                {
                    Button button = (Button)element;
                    button.IsEnabled = true;
                }
            }

            // Disables any seats that are already occupied.
            foreach (String seatNumber in clsPassengerManager.occupiedSeats)
            {
                // Finds the button in the seat grid with a name corresponding to the occupied seat number and disables it.
                Button seat = (Button)FindName("seat" + seatNumber);
                if (seat != null)
                {
                    DisableSeat(seat);
                }
            }

            // Array of buttons to disable/enable depending on the flight ID.
            Button[] nonActiveSeats = { seat19, seat20, seat21, seat22, seat23, seat24 };

            // Collapses the non-active seats for flight ID 1, and shows them for all other flight IDs.
            if (clsSelectedFlight.sFlightID == "1")
            {
                foreach (Button seat in nonActiveSeats)
                {
                    seat.Visibility = Visibility.Collapsed;
                }
            }
            else
            {
                foreach (Button seat in nonActiveSeats)
                {
                    seat.Visibility = Visibility.Visible;
                }
            }
        }

        /// <summary>
        /// Disables a seat button and sets its background color to red.
        /// </summary>
        /// <param name="seat">The button representing the seat to be disabled.</param>
        private void DisableSeat(Button seat)
        {
            seat.IsEnabled = false;
            seat.Background = Brushes.Red;
        }

        /// <summary>
        /// Handles the click event of the seat button by disabling the seat.
        /// </summary>
        /// <param name="sender">The button representing the seat that was clicked.</param>
        /// <param name="e">The event arguments.</param>
        private void btSeat_Click(object sender, RoutedEventArgs e)
        {
            DisableSeat((Button)sender);
        }

        /// <summary>
        /// Handles the click event of the delete passenger button.
        /// </summary>
        /// <param name="sender">The button that was clicked.</param>
        /// <param name="e">The event arguments.</param>
        private void btDeletePassenger_Click(object sender, RoutedEventArgs e)
        {

        }

        /// <summary>
        /// Handles the click event of the change seat button.
        /// </summary>
        /// <param name="sender">The button that was clicked.</param>
        /// <param name="e">The event arguments.</param>
        private void btChangeSeat_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
