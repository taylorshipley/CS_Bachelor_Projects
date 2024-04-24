using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public GameObject pickUpParent;
    public int activePickUps;

    private PlayerUIManager uiManager; // Reference to the UI manager.
    internal bool isGameOver = false;
    internal bool isGameWon;


    public AudioClip winSound;
    public AudioClip loseSound; // Sound played when game is lost.

    private AudioSource winloseSource;
    private AudioSource backgroundSource;

    // Start is called before the first frame update
    void Start()
    {

        winloseSource = GetComponent<AudioSource>();
        backgroundSource = GameObject.Find("BackgroundMusic").GetComponent<AudioSource>();
        uiManager = GameObject.Find("PlayerUIManager").GetComponent<PlayerUIManager>();
        Transform pickUpParentTransform = pickUpParent.transform;
        activePickUps = 0;

        foreach (Transform pickUp in pickUpParentTransform)
        {
            if (pickUp.gameObject.activeSelf)
            {
                activePickUps++;
            }
        }
    }

    public void GameOver()
    {
        backgroundSource.Stop();
        isGameOver = true;
        uiManager.ShowLoseText();
        winloseSource.PlayOneShot(loseSound, 1f);

    }

    public void GameWon()
    {
        backgroundSource.Stop();
        isGameWon = true;
        uiManager.ShowWinText();
        winloseSource.PlayOneShot(winSound, 1f);
    }
}
