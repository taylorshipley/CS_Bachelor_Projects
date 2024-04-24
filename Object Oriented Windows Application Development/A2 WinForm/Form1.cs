namespace A2_WinForm
{
    public partial class Form1 : Form
    {
        /// <summary>
        /// The Form1 class representing the main form for the application
        /// </summary>
        public Form1()
        {
            InitializeComponent();
        }


        // Random object used to generate random die rolls
        Random random = new Random();

        // Variable to keep track of the current die roll
        static int dieRoll = 0;

        // Variable to keep track of the previous die roll
        static int prevRoll = dieRoll;

        // Variables to keep track of the number of games played, won, and lost
        static int numPlayed = 0;
        static int numWon = 0;
        static int numLost = 0;

        // Variable to keep track of the user's guess
        static int userGuess = 0;

        // Variables to keep track of the frequency of each die roll
        static int freqValue1 = 0;
        static int freqValue2 = 0;
        static int freqValue3 = 0;
        static int freqValue4 = 0;
        static int freqValue5 = 0;
        static int freqValue6 = 0;

        // Variables to keep track of the number of times each number was guessed
        static int guessValue1 = 0;
        static int guessValue2 = 0;
        static int guessValue3 = 0;
        static int guessValue4 = 0;
        static int guessValue5 = 0;
        static int guessValue6 = 0;



        /// <summary>
        /// Event handler for the "Change Image" button click.
        /// Validates user input, animates the die rolling, and updates game statistics.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnRoll_Clicked(object sender, EventArgs e)
        {
            // Validates input is between 1-6 and displays error if invalid
            if (int.TryParse(tbUserGuess.Text, out int userInput))
            {
                if (userInput < 1 || userInput > 6) { invalidEntry.Visible = true; return; }
                else { userGuess = userInput; invalidEntry.Visible = false; }
            }
            else { invalidEntry.Visible = true; return; }

            dieFace.SizeMode = PictureBoxSizeMode.StretchImage;

            //For loop creates animation of die rolling
            for (int i = 0; i < 4; i++)
            {
                do { 
                    dieRoll = random.Next(1, 7);
                } while (prevRoll == dieRoll);
                dieFace.Image = Image.FromFile("Images/die" + dieRoll.ToString() + ".gif");
                dieFace.Refresh();
                Thread.Sleep(500);
            }
            winLose(userGuess, dieRoll);   
        }

        /// <summary>
        /// Method that handles the win or lose scenario for the game.
        /// </summary>
        /// <param name="userGuess">The number that the user has guessed</param>
        /// <param name="dieRoll">The number that is rolled on the die</param>
        private void winLose(int userGuess, int dieRoll)
        {
            //increments the number of games played and updates the text
            numXPlayed.Text = (numPlayed++).ToString();
            //checks if the user's guess matches the die roll
            //increments the number of games won and updates the text if true
            if (userGuess == dieRoll)
            { numXWon.Text = (numWon++).ToString(); }
            //increments the number of games lost and updates the text if false
            else { NumXLost.Text = (numLost++).ToString(); }

            //increments the frequency of the die roll value and updates the text
            switch (dieRoll)
            {
                case 1:
                    freqValue1 = freqValue1 + 1;
                    freq1.Text = (freqValue1).ToString();
                    break;
                case 2:
                    freqValue2 = freqValue2 + 1;
                    freq2.Text = (freqValue2).ToString();
                    break;
                case 3:
                    freqValue3 = freqValue3 + 1;
                    freq3.Text = (freqValue3).ToString();
                    break;
                case 4:
                    freqValue4 = freqValue4 + 1;
                    freq4.Text = (freqValue4).ToString();
                    break;
                case 5:
                    freqValue5 = freqValue5 + 1;
                    freq5.Text = (freqValue5).ToString();
                    break;
                case 6:
                    freqValue6 = freqValue6 + 1;
                    freq6.Text = (freqValue6).ToString();
                    break;
            }
            //increments the frequency of the user's guess value and updates the text
            switch (userGuess)
            {
                case 1:
                    guess1.Text = (guessValue1++).ToString();
                    break;
                case 2:
                    guess2.Text = (guessValue2++).ToString();
                    break;
                case 3:
                    guess3.Text = (guessValue3++).ToString();
                    break;
                case 4:
                    guess4.Text = (guessValue4++).ToString();
                    break;
                case 5:
                    guess5.Text = (guessValue5++).ToString();
                    break;
                case 6:
                    guess6.Text = (guessValue6++).ToString();
                    break;
            }
            //calls the updateRecords method
            updateRecords();
        }

        /// <summary>
        /// updateRecords method updates the percentage of the frequency of each die roll value
        /// </summary>
        private void updateRecords()
        {
            perc1.Text = Percentage(freqValue1);
            perc2.Text = Percentage(freqValue2);
            perc3.Text = Percentage(freqValue3);
            perc4.Text = Percentage(freqValue4);
            perc5.Text = Percentage(freqValue5);
            perc6.Text = Percentage(freqValue6);
        }

        /// <summary>
        /// Percentage method takes the frequency value of each die roll and calculates the percentage of it based on the total number of games played
        /// </summary>
        /// <param name="freqValue">frequency value of a die roll</param>
        /// <returns>percentage of the frequency value</returns>
        private string Percentage(double freqValue)
        {
            double percValue = Math.Round((freqValue * 100 / numPlayed), 2);
            return percValue.ToString() + "%";
        }

        /// <summary>
        /// btnClear_Click method is executed when the clear button is clicked, it restarts the application
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btnClear_Click(object sender, EventArgs e)
        {
            Application.Restart();
        }


    }
}