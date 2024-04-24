using System.Collections.Generic;
using UnityEngine;

public class QuizLoader : MonoBehaviour
{
    // Load quiz questions from a JSON file and return a list of QuizQuestion objects
    public List<QuizQuestion> LoadQuestionsFromJSON(string jsonFileName)
    {
        // Load the JSON file from the Resources folder
        TextAsset jsonFile = Resources.Load<TextAsset>(jsonFileName);
        if (jsonFile != null)
        {
            // Deserialize the JSON data into a QuizDataWrapper object
            QuizDataWrapper wrapper = JsonUtility.FromJson<QuizDataWrapper>(jsonFile.text);
            if (wrapper != null)
            {
                // Log success and return the list of questions
                Debug.Log("Questions loaded successfully. Count: " + wrapper.questions.Count);
                return wrapper.questions;
            }
            else
            {
                // Log an error if deserialization fails
                Debug.LogError("Failed to deserialize JSON data.");
            }
        }
        else
        {
            // Log an error if the JSON file fails to load
            Debug.LogError("Failed to load JSON file: " + jsonFileName);
        }

        // Return an empty list in case of failure
        return new List<QuizQuestion>();
    }
}

[System.Serializable]
public class QuizDataWrapper
{
    public List<QuizQuestion> questions; // Wrapper class to hold a list of QuizQuestion objects
}
