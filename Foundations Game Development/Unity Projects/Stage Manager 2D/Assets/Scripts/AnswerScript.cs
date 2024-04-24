using UnityEngine;
using UnityEngine.UI;

public class AnswerScript : MonoBehaviour
{
    public bool isCorrect = false; // Flag indicating if this answer is correct
    public QuizManager quizManager; // Reference to the QuizManager script
    internal Color startColor; // Initial color of the answer button

    private void OnEnable()
    {
        // Save the initial color of the answer button when the button becomes active
        startColor = GetComponent<Image>().color;
    }

    // Called when the player selects this answer
    public void Answer()
    {
        // Check if player input is enabled
        if (quizManager.isPlayerInputEnabled)
        {
            // Pause the timer when an answer is submitted
            quizManager.timeController.StopTimer();

            // Check if the selected answer is correct
            if (isCorrect)
            {
                //Debug.Log("Correct Answer");
                // Handle correct answer in QuizManager
                quizManager.Correct();
                // Change the color of the answer button to green
                GetComponent<Image>().color = Color.green;
            }
            else
            {
                //Debug.Log("Wrong Answer");
                // Handle wrong answer in QuizManager
                quizManager.Wrong();
                // Change the color of the answer button to red
                GetComponent<Image>().color = Color.red;
            }
        }
    }
}
