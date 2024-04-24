using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using Unity.VisualScripting;

public class QuizManager : MonoBehaviour
{
    private List<QuizQuestion> QnA; // List to store QuizQuestion objects
    public GameObject[] MultipleChoiceButtons; // Array to store multiple choice answer buttons
    private int currentQuestion; // Index of the current question
    public TextMeshProUGUI QuestionTxt; // Text object to display the question

    public QuizLoader quizLoader; // Reference to the QuizLoader script
    public string jsonFilePath; // Path to the JSON file containing quiz questions

    public GameObject TitleScreen; // Panel containing the Title Screen
    public GameObject QuizPanel; // Panel containing the quiz
    public GameObject GOPanel; // Game Over panel
    public TextMeshProUGUI TotalCorrect; // Text object to display the number of correctly answered questions

    public TextMeshProUGUI TotalScore; // Text object to display the final score

    private int totalQuestions = 20; // Total number of questions in the quiz
    public int questionsAsked; // Number of questions answered by the player
    private int CorrectAnswerCount; // Number of correct answers
    internal bool isPlayerInputEnabled = true; // Flag to control player input

    public TimerController timeController; // Reference to the TimerController script
    private PointSystem pointSystem; // Point system for scoring

    public AudioController audioController; // Reference to the AudioController script
    private bool isGameActive;

    public StarManager starManager;  // Reference to the StarManager script

    public FinalStarPanel finalStarPanel;  // Reference to the StarManager script

    public bool devMode;


    private void Start()
    {
        // Load questions from JSON file
        QnA = quizLoader.LoadQuestionsFromJSON(jsonFilePath);

        // Activates up Title Panel
        TitleScreen.SetActive(true);
        GOPanel.SetActive(false);
        QuizPanel.SetActive(false);

        isGameActive = false;
        

        // Initialize point system
        pointSystem = new PointSystem();
    }

    public void StartGame()
    {

        // Set initial panel visibility
        GOPanel.SetActive(false);
        TitleScreen.SetActive(false);
        QuizPanel.SetActive(true);

        // Initializes questions asked to 0
        questionsAsked = 0;

        if (devMode)
        {
            questionsAsked = 19;
        }
        isGameActive = true;

        // Generate the first question
        GenerateQuestion();
    }

    private void Update()
    {
        // Check if time is up for the current question
        if (timeController.currentTime <= 0 && isGameActive)
        {
            // Handle wrong answer when time is up
            Wrong();
        }
    }

    // Restart the quiz
    public void Retry()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
    }

    // Display Game Over panel and show the player's score
    public void GameOver()
    {
        //Debug.Log("Filled Game Over Stars " + starManager.filledStars);
        starManager.SetStars(pointSystem.GetCurrentScore());
        finalStarPanel.SetFinalStars(starManager.filledStars);

        QuizPanel.SetActive(false);
        GOPanel.SetActive(true);
        TotalCorrect.text = "Correct Answeres: " + CorrectAnswerCount + "/" + totalQuestions;

        TotalScore.text = "Your Score: " + pointSystem.GetCurrentScore().ToString("N0");
    }

    // Handle correct answer
    public void Correct()
    {
        // Increment correct answer count
        CorrectAnswerCount++;

        // Remove the current question from the list
        QnA.RemoveAt(currentQuestion);

        // Calculate points based on time multiplier and correct streak
        pointSystem.CorrectAnswer(timeController.GetCurrentTime());

        // Play correct sound
        audioController.playCorrectSound();

        // Wait for a moment before moving to the next question
        StartCoroutine(WaitForNext());
    }

    // Handle wrong answer
    public void Wrong()
    {
        // Remove the current question from the list
        QnA.RemoveAt(currentQuestion);

        // Reset correct answer streak
        pointSystem.WrongAnswer();

        // Resests Timer
        timeController.ResetTimer();
        

        // Play wrong sound
        audioController.playWrongSound();

        // Wait for a moment before moving to the next question
        StartCoroutine(WaitForNext());
    }

    // Coroutine to wait for a moment before generating the next question
    IEnumerator WaitForNext()
    {
        isPlayerInputEnabled = false; // Disable player input
        yield return new WaitForSeconds(2);
        GenerateQuestion();
        isPlayerInputEnabled = true; // Enable player input
    }

    // Generate a new question
    void GenerateQuestion()
    {
        // Reset the timer
        timeController.ResetTimer();

        // Check if there are remaining questions
        if (QnA.Count > 0 && questionsAsked < totalQuestions)
        {
            // Increment the number of questions asked
            questionsAsked++;

            // Select a random question
            currentQuestion = Random.Range(0, QnA.Count);

            // Display the selected question and set the answer choices
            QuestionTxt.text = QnA[currentQuestion].Question;
            SetAnswers();

            // Update stars based on player's score after each question
            starManager.SetStars(pointSystem.GetCurrentScore());

            // Start the timer for the current question
            timeController.StartTimer();
        }
        else
        {
            // No more questions, end the game
            GameOver();
        }
    }

    // Set answer choices for the current question
    void SetAnswers()
    {
        for (int i = 0; i < 4; i++)
        {
            // Set answer text for each button
            MultipleChoiceButtons[i].GetComponent<Image>().color = MultipleChoiceButtons[i].GetComponent<AnswerScript>().startColor;
            MultipleChoiceButtons[i].GetComponent<AnswerScript>().isCorrect = false;
            MultipleChoiceButtons[i].transform.GetChild(0).GetComponent<TextMeshProUGUI>().text = QnA[currentQuestion].Answers[i].AnswerText;

            // Mark the correct answer
            if (QnA[currentQuestion].Answers[i].IsCorrect)
            {
                MultipleChoiceButtons[i].GetComponent<AnswerScript>().isCorrect = true;
            }
        }
    }
}
