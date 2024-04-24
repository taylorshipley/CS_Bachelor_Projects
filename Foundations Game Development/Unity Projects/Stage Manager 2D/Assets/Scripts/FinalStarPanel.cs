using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FinalStarPanel : MonoBehaviour
{
    internal int maxStars = 4;  // Total number of stars
    public RawImage[] stars;  // Array to hold star images

    // Set the number of stars to display based on the player's performance
    public void SetFinalStars(int finalStarCount)
    {
        //Debug.Log("Final Star Count: " + finalStarCount);
       
        // Get star images from children
        stars = new RawImage[maxStars];
        for (int i = 0; i < maxStars; i++)
        {
            stars[i] = transform.Find($"StarUI{i + 1}").GetComponent<RawImage>();
        }

        //Debug.Log("Final Star Array: " + stars.Length);
        // Activate the appropriate number of stars
        for (int i = 0; i < stars.Length; i++)
        {
            //Debug.Log($"Activating star {i}: {i < finalStarCount}");
            stars[i].gameObject.SetActive(i < finalStarCount);
        }
    }
}