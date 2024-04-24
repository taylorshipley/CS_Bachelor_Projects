using System;
using System.Collections.Generic;
using System.Reflection;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Media;

namespace Assignment6AirlineReservation
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        
        clsDataAccess clsData;
        wndAddPassenger wndAddPass;
        Canvas FlightLayout;
        clsFlight SelectedFlight;
        clsPassenger SelectedPassenger;
        clsPassengerManager PassengerManager;
        string sSelectedSeatNum;
        private List<clsFlight> Flights;
        private List<clsPassenger> Passengers;
        Boolean upd = false;
        public MainWindow()
        {
            try
            {
                InitializeComponent();
                Application.Current.ShutdownMode = ShutdownMode.OnMainWindowClose;

                // Load the list of Flights using the LoadFlights() method
                Flights = clsFlightManager.LoadFlights();

                // Set the ItemsSource property to the list of Flights
                cbChooseFlight.ItemsSource = Flights;

                // Set the DisplayMemberPath property to "sFlightNumber"
                cbChooseFlight.DisplayMemberPath = "sFlightNumber";

                // Set the SelectedValuePath property to "sFlightID"
                cbChooseFlight.SelectedValuePath = "sFlightID";

                // Bind the SelectedValue property to a property in your code-behind
                Binding selectedValueBinding = new Binding("sSelectedFlightId");
                selectedValueBinding.Mode = BindingMode.TwoWay;
                cbChooseFlight.SetBinding(ComboBox.SelectedValueProperty, selectedValueBinding);
            }
            catch (Exception ex)
            {
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name,
                    MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }

        /// <summary>
        /// Event handler for the SelectionChanged event of the cbChooseFlight combo box.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event data.</param>
        private void cbChooseFlight_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                // Disable the "Add Passenger" button
                cmdAddPassenger.IsEnabled = false;

                // Get the selected flight from the combo box
                SelectedFlight = cbChooseFlight.SelectedItem as clsFlight;

                if (SelectedFlight != null)
                {
                    // Do something with the selected flight
                    string selectedFlightId = SelectedFlight.sFlightID;

                    // If the selected flight is Flight 1
                    if (selectedFlightId == "1")
                    {
                        // Hide the A380 canvas and show the 767 canvas
                        CanvasA380.Visibility = Visibility.Hidden;
                        Canvas767.Visibility = Visibility.Visible;
                        FlightLayout = c767_Seats; // Set the FlightLayout variable to c767_Seats
                    }
                    else
                    {
                        // Hide the 767 canvas and show the A380 canvas
                        Canvas767.Visibility = Visibility.Hidden;
                        CanvasA380.Visibility = Visibility.Visible;
                        FlightLayout = cA380_Seats; // Set the FlightLayout variable to cA380_Seats
                    }

                    // Enable the "Choose Passenger" combo box
                    cbChoosePassenger.IsEnabled = true;

                    // Load the list of passengers for the selected flight
                    Passengers = clsPassengerManager.LoadPassengers(selectedFlightId);

                    // Set the ItemsSource property of the cbChoosePassenger combo box to the list of passengers
                    cbChoosePassenger.ItemsSource = Passengers;

                    // Set the DisplayMemberPath property of the cbChoosePassenger combo box to "sFullName"
                    cbChoosePassenger.DisplayMemberPath = "sFullName";

                    // Set the SelectedValuePath property of the cbChoosePassenger combo box to "sPassengerID"
                    cbChoosePassenger.SelectedValuePath = "sPassengerID";

                    // Bind the SelectedValue property of the cbChoosePassenger combo box to a property in your code-behind
                    Binding selectedValueBinding = new Binding("SelectedPassengerID");
                    selectedValueBinding.Mode = BindingMode.TwoWay;
                    cbChoosePassenger.SetBinding(ComboBox.SelectedValueProperty, selectedValueBinding);

                    // Load the selected flight (this method is not shown in this code)
                    LoadSelectedFlight(null);
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name,
                    MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }


        /// <summary>
        /// Event handler for the Click event of the cmdAddPassenger button.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event data.</param>
        private void cmdAddPassenger_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                // Open a window to add a new passenger
                wndAddPass = new wndAddPassenger(SelectedFlight.sFlightID, sSelectedSeatNum);
                wndAddPass.ShowDialog();

                // Reload the list of passengers
                string selectedFlightId = SelectedFlight.sFlightID;

                // Load the list of passengers for the selected flight
                Passengers = clsPassengerManager.LoadPassengers(selectedFlightId);

                // Set the ItemsSource property of the cbChoosePassenger combo box to the list of passengers
                cbChoosePassenger.ItemsSource = Passengers;

                // Load the selected flight (this method is not shown in this code)
                LoadSelectedFlight(null);
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name,
                    MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }


        /// <summary>
        /// Handles an error by displaying an error message in a message box and/or logging the error to a file.
        /// </summary>
        /// <param name="sClass">The name of the class in which the error occurred.</param>
        /// <param name="sMethod">The name of the method in which the error occurred.</param>
        /// <param name="sMessage">The error message.</param>
        private void HandleError(string sClass, string sMethod, string sMessage)
        {
            try
            {
                // Display an error message in a message box
                MessageBox.Show(sClass + "." + sMethod + " -> " + sMessage);
            }
            catch (System.Exception ex)
            {
                // If there's an error displaying the message box, log the error to a file instead
                System.IO.File.AppendAllText(@"C:\Error.txt", Environment.NewLine + "HandleError Exception: " + ex.Message);
            }
        }


        /// <summary>
        /// Event handler for the SelectionChanged event of the cbChoosePassenger combo box.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event data.</param>
        private void cbChoosePassenger_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                if (cbChoosePassenger.SelectedIndex != -1)
                {
                    // If a passenger is selected, enable the ChangeSeat and DeletePassenger buttons and disable the AddPassenger button
                    cmdDeletePassenger.IsEnabled = true;
                    cmdChangeSeat.IsEnabled = true;
                    cmdAddPassenger.IsEnabled = false;
                    SelectedPassenger = cbChoosePassenger.SelectedItem as clsPassenger;
                }
                else
                {
                    // If no passenger is selected, disable the ChangeSeat and DeletePassenger buttons and clear the selected passenger
                    cmdDeletePassenger.IsEnabled = false;
                    cmdChangeSeat.IsEnabled = false;
                    SelectedPassenger = null;
                    lblPassengersSeatNumber.Content = "";
                }

                if (SelectedPassenger != null)
                {
                    // If a passenger is selected, display their seat number
                    lblPassengersSeatNumber.Content = SelectedPassenger.sSeatNumber;
                }

                // Load the selected flight and update the passenger list (this method is not shown in this code)
                LoadSelectedFlight(SelectedPassenger);
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur and log the error message with the HandleError method
                HandleError(MethodInfo.GetCurrentMethod().DeclaringType.Name, MethodInfo.GetCurrentMethod().Name, ex.Message);
            }
        }


        /// <summary>
        /// Loads the selected flight into the seat grid and disables any seats that are already occupied.
        /// </summary>
        /// <param name="selectedPassenger">The selected passenger, if any.</param>
        private void LoadSelectedFlight(clsPassenger selectedPassenger)
        {
            // Enable all buttons in the seat grid
            foreach (UIElement element in FlightLayout.Children)
            {
                if (element is Label)
                {
                    Label label = (Label)element;
                    label.Background = Brushes.Blue; // Set the background color of the seat button to blue
                }
            }

            // Disable any seats that are already occupied
            foreach (clsPassenger Passenger in Passengers)
            {
                string seatNumber = Passenger.sSeatNumber;
                Label seat = null;

                // Find the label in the seat canvas with a name corresponding to the occupied seat number and disable it
                if (FlightLayout == cA380_Seats) // If the flight layout is for an Airbus A380
                {
                    seat = (Label)FindName("SeatA" + seatNumber); // Find the seat label with the corresponding seat number in the A380 seat layout
                }
                else
                {
                    seat = (Label)FindName("Seat" + seatNumber); // Find the seat label with the corresponding seat number in the standard seat layout
                }

                if (seat != null)
                {
                    if (Passenger == selectedPassenger)
                    {
                        // If the seat corresponds to the selected passenger, select it
                        SelectSeat(seat); // Call the SelectSeat method to highlight the seat
                    }
                    else
                    {
                        // Otherwise, disable the seat
                        DisableSeat(seat); // Call the DisableSeat method to disable the seat
                    }
                }
            }
        }


        /// <summary>
        /// Selects a seat by changing its background color to green.
        /// </summary>
        /// <param name="seat">The label representing the seat to be selected.</param>
        private void SelectSeat(Label seat)
        {
            seat.Background = Brushes.Green; // Set the background color of the seat button to green
        }


        /// <summary>
        /// Disables a seat button and sets its background color to red.
        /// </summary>
        /// <param name="seat">The button representing the seat to be disabled.</param>
        private void DisableSeat(Label seat)
        {
            seat.Background = Brushes.Red;
        }

        /// <summary>
        /// Event handler for the MouseDown event of the seat labels in the seat grid.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event data.</param>
        private void Seat_Clicked(object sender, MouseButtonEventArgs e)
        {
            if (!upd)
            {
                // If we're not in "update passenger" mode...
                if (cbChooseFlight.SelectedIndex != -1)
                {
                    // If a flight is selected in the cbChooseFlight combo box...
                    cbChoosePassenger.SelectedIndex = -1; // Clear the selected passenger combo box
                    LoadSelectedFlight(SelectedPassenger); // Load the selected flight and disable occupied seats
                    Label clickedLabel = sender as Label; // Get the seat label that was clicked

                    if (clickedLabel.Background == Brushes.Green)
                    {
                        // Do something if background is green
                    }
                    else if (clickedLabel.Background == Brushes.Red)
                    {
                        // Do something if background is red
                    }
                    else if (clickedLabel.Background == Brushes.Blue)
                    {
                        // Enable the AddPassenger button and select the clicked seat
                        cmdAddPassenger.IsEnabled = true;
                        SelectSeat(clickedLabel); // Highlight the clicked seat
                        sSelectedSeatNum = clickedLabel.Content.ToString(); // Store the selected seat number
                    }
                }
            }
            else if (upd)
            {
                // If we're in "update passenger" mode...
                Label clickedLabel = sender as Label; // Get the seat label that was clicked
                if (clickedLabel.Background == Brushes.Blue)
                {
                    // Select the clicked seat, change the passenger's seat, and reload the list of passengers
                    SelectSeat(clickedLabel); // Highlight the clicked seat
                    sSelectedSeatNum = clickedLabel.Content.ToString(); // Store the selected seat number
                    clsPassengerManager.ChangePassengerSeat(SelectedPassenger, SelectedFlight, sSelectedSeatNum); // Update the passenger's seat number in the database
                    string selectedFlightId = SelectedFlight.sFlightID;
                    Passengers = clsPassengerManager.LoadPassengers(selectedFlightId); // Reload the list of passengers for the selected flight
                    cbChoosePassenger.ItemsSource = Passengers; // Update the passenger combo box with the new list of passengers
                    LoadSelectedFlight(null); // Load the selected flight and disable occupied seats
                    upd = false; // Exit "update passenger" mode
                }
            }
        }

        /// <summary>
        /// Event handler for the Click event of the cmdDeletePassenger button.
        /// Deletes the currently selected passenger from the list of passengers for the selected flight.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event data.</param>
        private void cmdDeletePassenger_Click(object sender, RoutedEventArgs e)
        {
            // Delete the selected passenger from the database
            clsPassengerManager.DeletePassenger(SelectedPassenger, SelectedFlight);

            // Reload the list of passengers for the selected flight
            string selectedFlightId = SelectedFlight.sFlightID;
            Passengers = clsPassengerManager.LoadPassengers(selectedFlightId);

            // Update the passenger combo box with the new list of passengers
            cbChoosePassenger.ItemsSource = Passengers;

            // Reload the seat grid with the updated list of passengers
            LoadSelectedFlight(null);
        }


        /// <summary>
        /// Event handler for the Click event of the cmdChangeSeat button.
        /// Puts the application in "update passenger" mode, where the user can change the selected passenger's seat.
        /// </summary>
        /// <param name="sender">The object that raised the event.</param>
        /// <param name="e">The event data.</param>
        private void cmdChangeSeat_Click(object sender, RoutedEventArgs e)
        {
            // Set the upd flag to true, indicating that the application is in "update passenger" mode
            upd = true;

            // Show a message box instructing the user to select a seat to change to
            MessageBox.Show("Select any open (blue) seat to change to");
        }
    }
}
