using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment4
{
    /// <summary>
    /// Represents a Tic Tac Toe game.
    /// </summary>
    public class TicTacToeGame
    {
        /// <summary>
        /// The size of the game board.
        /// </summary>
        private const int BoardSize = 3;

        /// <summary>
        /// The Row that won the game.
        /// </summary>
        private String[] winningMove = new String[3];

        /// <summary>
        /// The game board.
        /// </summary>
        public readonly char[,] _board = new char[BoardSize, BoardSize];

        /// <summary>
        /// Indicates whose turn it is. True for player 1, false for player 2.
        /// </summary>
        private bool _player1Turn = true;

        /// <summary>
        /// Returns the current player.
        /// </summary>
        /// <returns>The current player, 'X' or 'O'.</returns>
        public char GetCurrentPlayer()
        {
            return _player1Turn ? 'X' : 'O';
        }

        /// <summary>
        /// Plays a move at the specified row and column.
        /// </summary>
        /// <param name="row">The row where the move is played.</param>
        /// <param name="col">The column where the move is played.</param>
        /// <returns>True if the move is valid and played, false otherwise.</returns>
        public bool PlayMove(int row, int col)
        {
            if (row < 0 || row >= BoardSize || col < 0 || col >= BoardSize)
            {
                // Invalid move
                return false;
            }
            if (_board[row, col] != '\0')
            {
                // Position already occupied
                return false;
            }

            _board[row, col] = GetCurrentPlayer();

            return true;
        }

        /// <summary>
        /// Changes the turn to the other player.
        /// </summary>
        public void ChangeTurn()
        {
            _player1Turn = !_player1Turn;
        }

        /// <summary>
        /// Gets the array winningMove which tells us what buttons are 3 in a row
        /// </summary>
        /// <returns>The winning move array with the name of the buttons that won </returns>
        public String[] getWinningMove()
        {
            return winningMove;
        }

        /// <summary>
        /// Clears the game board.
        /// </summary>
        public void ClearBoard()
        {
            Array.Clear(winningMove, 0, 3);
            Array.Clear(_board, 0, _board.Length);
        }

        /// <summary>
        /// Checks if the game is over and returns the winner if there is one.
        /// </summary>
        /// <param name="winner">The winner of the game, 'X' or 'O'.</param>
        /// <returns>True if the game is over, false otherwise.</returns>
        public bool IsGameOver(out char winner)
        {
            winner = '\0';

            // Check rows
            for (int row = 0; row < BoardSize; row++)
            {
                if (_board[row, 0] != '\0' && _board[row, 0] == _board[row, 1] && _board[row, 1] == _board[row, 2])
                {
                    winner = _board[row, 0];
                    for (int i = 0; i < 3; i++)
                    {
                        string winningTile = "Tile" + row.ToString() + i.ToString();
                        winningMove[i] = winningTile;
                    }
                    return true;
                }
            }

            // Check columns
            for (int col = 0; col < BoardSize; col++)
            {
                if (_board[0, col] != '\0' && _board[0, col] == _board[1, col] && _board[1, col] == _board[2, col])
                {
                    winner = _board[0, col];
                    for (int i = 0; i < 3; i++)
                    {
                        string winningTile = "Tile" + i.ToString() + col.ToString();
                        winningMove[i] = winningTile;
                    }
                    return true;
                }
            }

            // Check diagonals
            if (_board[0, 0] != '\0' && _board[0, 0] == _board[1, 1] && _board[1, 1] == _board[2, 2])
            {
                winner = _board[0, 0];
                winningMove[0] = "Tile00";
                winningMove[1] = "Tile11";
                winningMove[2] = "Tile22";
                return true;
            }

            if (_board[0, 2] != '\0' && _board[0, 2] == _board[1, 1] && _board[1, 1] == _board[2, 0])
            {
                winner = _board[0, 2];
                winningMove[0] = "Tile02";
                winningMove[1] = "Tile11";
                winningMove[2] = "Tile20";
                return true;
            }

            // Check for tie
            for (int row = 0; row < BoardSize; row++)
            {
                for (int col = 0; col < BoardSize; col++)
                {
                    if (_board[row, col] == '\0')
                    {
                        // Board is not full, game is not over
                        return false;
                    }
                }
            }

            // Board is full, game is a tie
            return true;
        }
    }

}
