using UnityEngine;
using TMPro;

public class PlayerUIManager : MonoBehaviour
{
    public int score;
    public TextMeshProUGUI countText;
    public GameObject loseTextObject;
    public GameObject winTextObject;

    public void Initialize()
    {
        score = 0;
        UpdateCountText();
        winTextObject.SetActive(false);
        loseTextObject.SetActive(false);
    }

    public void IncrementCount()
    {
        score++;
        UpdateCountText();
    }

    public void ShowWinText()
    {
        winTextObject.SetActive(true);
    }

    public void ShowLoseText()
    {
        loseTextObject.SetActive(true);
    }

    private void UpdateCountText()
    {
        countText.text = "Count: " + score.ToString();
    }
}
