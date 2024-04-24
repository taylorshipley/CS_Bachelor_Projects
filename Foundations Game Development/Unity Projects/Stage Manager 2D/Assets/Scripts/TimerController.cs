using UnityEngine;
using TMPro;

public class TimerController : MonoBehaviour
{
    internal float totalTime = 30f; // Total time for the timer
    internal float currentTime; // Current time remaining
    private TextMeshProUGUI timerText; // TextMeshProUGUI component to display the timer
    private bool isTimerRunning = false; // Flag to track the timer state

    // Start is called before the first frame update
    private void Start()
    {
        timerText = GetComponent<TextMeshProUGUI>(); // Get the TextMeshProUGUI component
        ResetTimer(); // Reset the timer at the start
    }

    // Update is called once per frame
    private void Update()
    {
        // Update the timer only if it's running
        if (isTimerRunning)
        {
            currentTime -= Time.deltaTime; // Decrease the current time based on real-time
            UpdateTimerUI(); // Update the visual representation of the timer

            if (currentTime <= 0)
            {
                // Stop the timer when it reaches zero
                isTimerRunning = false;
            }
        }
    }

    // Update the TextMeshProUGUI component with the formatted time
    void UpdateTimerUI()
    {
        // Display the remaining seconds only
        int seconds = Mathf.Max(0, Mathf.FloorToInt(currentTime)); // Ensure seconds are not below 0

        // Update the TextMeshProUGUI component with the formatted time
        timerText.text = string.Format("{0}", seconds);
    }

    // Start the timer with the total time
    public void StartTimer()
    {
        isTimerRunning = true; // Set the timer to be running
        currentTime = totalTime; // Set the current time to the total time
    }

    // Stop the timer
    public void StopTimer()
    {
        isTimerRunning = false; // Set the timer to be stopped
    }

    // Reset the timer to the initial total time
    public void ResetTimer()
    {
        currentTime = totalTime; // Reset the current time to the total time
    }

    // Get the current time remaining
    public float GetCurrentTime()
    {
        return currentTime;
    }
}
