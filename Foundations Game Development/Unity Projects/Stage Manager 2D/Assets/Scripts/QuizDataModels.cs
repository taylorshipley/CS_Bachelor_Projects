[System.Serializable]
public class AnswerData
{
    public string AnswerText; // Text of the answer
    public bool IsCorrect; // Flag indicating if the answer is correct
}

[System.Serializable]
public class QuizQuestion
{
    public string Question; // Text of the question
    public AnswerData[] Answers; // Array of possible answers for the question
}
