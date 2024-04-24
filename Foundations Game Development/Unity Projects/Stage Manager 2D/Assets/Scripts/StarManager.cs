using UnityEngine;
using UnityEngine.UI;

public class StarManager : MonoBehaviour
{
    internal int maxStars = 4;  // Total number of stars
    public int filledStars = 0;  // Number of stars to fill based on player performance
    public RawImage[] stars;  // Array to hold star images

    void Start()
    {
        // Get star images from children
        stars = new RawImage[maxStars];
        for (int i = 0; i < maxStars; i++)
        {
            stars[i] = transform.Find($"StarUI{i + 1}").GetComponent<RawImage>();
        }

        // Initialize stars based on filledStars
        SetStars(filledStars);
    }

    // Set the number of stars to display based on the player's performance
    public void SetStars(int points)
    {
        filledStars = Mathf.FloorToInt(points / 100); // Adjust this calculation based on your scoring system

        // Ensure the number of stars is within the valid range
        filledStars = Mathf.Clamp(filledStars, 0, stars.Length);

        // Activate the appropriate number of stars
        for (int i = 0; i < stars.Length; i++)
        {
            //Debug.Log("Activating Star: " + i);
            stars[i].gameObject.SetActive(i < filledStars);
        }
    }
}