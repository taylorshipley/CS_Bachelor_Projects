using System;
using System.Drawing;
using System.Windows.Forms;

namespace Assignment4
{
    public partial class Form1 : Form
    {
        /// <summary>
        /// The number of times X has won the game.
        /// </summary>
        private int numXWins = 0;

        /// <summary>
        /// The number of times O has won the game.
        /// </summary>
        private int numOWins = 0;

        /// <summary>
        /// The number of times the game has ended in a tie.
        /// </summary>
        private int numTies = 0;


        /// <summary>
        /// The TicTacToe game object.
        /// </summary>
        private readonly TicTacToeGame _game;

        public Form1()
        {
            InitializeComponent();
            _game = new TicTacToeGame();
            UpdateStatus();
        }

        /// <summary>
        /// Handles the click event of a tile on the board.
        /// </summary>
        /// <param name="sender">The sender of the event.</param>
        /// <param name="e">The event arguments.</param>
        private void Tile_Click(object sender, EventArgs e)
        {

            Button clickedBtn = (Button)sender;
            int row = int.Parse(clickedBtn.Name.Substring(4, 1));
            int col = int.Parse(clickedBtn.Name.Substring(5, 1));
            if (_game.PlayMove(row, col))
            {
                clickedBtn.Text = _game.GetCurrentPlayer().ToString();
                clickedBtn.Enabled = false;
                if (_game.IsGameOver(out char winner))
                {
                    // Game is over
                    ShowWinner(winner);
                    DisableBoard();
                }
                else
                {
                    // Game continues
                    _game.ChangeTurn();
                    UpdateStatus();
                }
            }
        }

        /// <summary>
        /// Updates the game status label with the current turn.
        /// </summary>
        private void UpdateStatus()
        {
            GameStatus.Text = $"Turn: Player " + _game.GetCurrentPlayer();
        }

        /// <summary>
        /// Shows the winner of the game and updates the score labels accordingly.
        /// </summary>
        /// <param name="winner">The winner of the game.</param>
        private void ShowWinner(char winner)
        {
            String[] winningMove = _game.getWinningMove();
            if (winningMove[0] != null)
            {
                foreach (string buttonName in winningMove)
                {
                    Button winningButton = Controls.Find(buttonName, true).FirstOrDefault() as Button;
                    // check if the button was found
                    if (winningButton != null)
                    {
                        // Highlights winning row
                        winningButton.BackColor = Color.Yellow;
                    }
                }
            }


            // Game is tied
            string message;
            if (winner == '\0')
            {
                message = "The game is a tie!";
                numTies++;
                tiesScoreLb.Text = numTies.ToString();
            }
            else
            {   // Player X Wins
                message = $"Player {winner} wins!";
                if (winner == 'X')
                {
                    numXWins++;
                    xScoreLb.Text = numXWins.ToString();
                }
                else
                {
                    // Player O Wins
                    numOWins++;
                    oScoreLb.Text = numOWins.ToString();
                }
            }
            GameStatus.Text = (message);
        }

        /// <summary>
        /// Disables all buttons on the game board.
        /// </summary>
        private void DisableBoard()
        {

            // Create a list of the buttons to disable
            var gameTiles = new[]
            {
                Tile00, Tile01, Tile02,
                Tile10, Tile11, Tile12,
                Tile20, Tile21, Tile22
            };
            foreach (var button in gameTiles)
            {
                button.Enabled = false;
            }
        }

        /// <summary>
        /// Resets the game board and score labels to start a new game.
        /// </summary>
        /// <param name="sender">The sender of the event.</param>
        /// <param name="e">The event arguments.</param>
        private void RestartGame_Click(object sender, EventArgs e)
        {
            _game.ClearBoard();

            // Create a list of the buttons to reset
            var gameTiles = new[]
            {
                Tile00, Tile01, Tile02,
                Tile10, Tile11, Tile12,
                Tile20, Tile21, Tile22
            };

            // Loop through the list and reset each button
            foreach (var button in gameTiles)
            {
                button.Enabled = true;
                button.BackColor = Color.DarkGray;
                button.Text = "";
            }

            UpdateStatus();
        }

    }
}
