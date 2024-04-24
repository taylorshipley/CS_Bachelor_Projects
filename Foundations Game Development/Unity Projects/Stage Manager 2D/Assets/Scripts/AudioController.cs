using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioController : MonoBehaviour
{
    public AudioClip correctSound; // Sound for correct answers
    public AudioClip wrongSound; // Sound for wrong answers
    private AudioSource audioSource; // AudioSource component to play audio clips

    private void Start()
    {
        audioSource = GetComponent<AudioSource>(); // Get the AudioSource component at the start
    }

    // Play the correct answer sound
    public void playCorrectSound()
    {
        audioSource.PlayOneShot(correctSound);
    }

    // Play the wrong answer sound
    public void playWrongSound()
    {
        audioSource.PlayOneShot(wrongSound);
    }
}
