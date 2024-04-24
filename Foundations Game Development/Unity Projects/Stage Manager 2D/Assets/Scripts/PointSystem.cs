using UnityEngine;
using UnityEngine.UI;

public class PointSystem
{
    private int playerPoints = 0; // Player's total points
    private int correctStreak = 0; // Current correct answer streak
    private int PlayerPoints => playerPoints; // Property to access player's total points

    // Called when the player gives a correct answer
    // Called when the player gives a correct answer
    public void CorrectAnswer(float remainingTime)
    {
        // Calculate bonus points based on remaining time
        int bonusPoints = Mathf.FloorToInt(remainingTime * 2);

        // Calculate points for the current round based on the bonus and correct streak
        int roundPoints = 100 + bonusPoints + (correctStreak * 50);

        // Update correct answer streak
        correctStreak++;

        // Update the total points
        playerPoints += roundPoints;

        // Log round points, bonus points, correct streak, and total points
        // Debug.Log("Round Points: " + roundPoints + ", Bonus Points: " + bonusPoints + ", Correct Streak: " + correctStreak + ", Total Points: " + playerPoints);
    }


    // Called when the player gives a wrong answer
    public void WrongAnswer()
    {
        // Apply penalty for wrong answer (adjust the penalty as needed)
        int penalty = 100;
        playerPoints = Mathf.Max(0, playerPoints - penalty);

        correctStreak = 0; // Reset correct answer streak

        // Log penalty and total points
        // Debug.Log("Penalty: " + penalty + ", Total Points: " + playerPoints);
    }

    // Get the current total score of the player
    public int GetCurrentScore()
    {
        return playerPoints;
    }
}