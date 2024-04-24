using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.InputSystem;
using TMPro;

public class PlayerController : MonoBehaviour
{
    private Rigidbody playerRb;   // Reference to the player's Rigidbody component.
    private float movementX;     // Stores horizontal movement input.
    private float movementY;     // Stores vertical movement input.

    private GameManager gameManager;  // Reference to the game manager.
    private PlayerUIManager uiManager; // Reference to the UI manager.

    private float speed = 5;           // Player movement speed.
    private float decelerationFactor = 2; // Factor for deceleration.
    private Vector3 respawnPosition;  // The position to respawn the player.
    private float minYPosition = -6;   // Minimum Y position allowed.

    private bool canJump;         // Indicates if the player can jump.
    private float jumpForce;      // Force applied when jumping.
    private float jumpDelayTime;  // Delay time between jumps.

    public AudioClip jumpSound;   // Sound played when jumping.
    public AudioClip pickupSound;
    public AudioSource playerAudio;  // AudioSource for playing sounds.

    private void Awake()
    {
        uiManager = GameObject.Find("PlayerUIManager").GetComponent<PlayerUIManager>();
        uiManager.Initialize();  // Initialize the UI manager.
    }

    private void Start()
    {
        gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
        playerAudio = GetComponent<AudioSource>();
        playerRb = GetComponent<Rigidbody>();
        respawnPosition = transform.position;

        jumpDelayTime = 1f;
        jumpForce = 5f;
        canJump = true;
    }

    // This function is called when a move input is detected.
    void OnMove(InputValue movementValue)
    {
        if (!gameManager.isGameOver)
        {
            // Convert the input value into a Vector2 for movement.
            Vector2 movementVector = movementValue.Get<Vector2>();

            // Store the X and Y components of the movement.
            movementX = movementVector.x;
            movementY = movementVector.y;
        }
    }

    void OnJump()
    {
        if (canJump && !gameManager.isGameOver)
        {
            // Handle the jump action here.
            canJump = false;
            playerAudio.PlayOneShot(jumpSound, 1.0f);
            playerRb.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);
            StartCoroutine(JumpDelay(jumpDelayTime));
        }
    }

    // Coroutine to reset canJump after a delay.
    private IEnumerator JumpDelay(float delay)
    {
        yield return new WaitForSeconds(delay);
        canJump = true;
    }

    // FixedUpdate is called once per fixed frame-rate frame.
    private void FixedUpdate()
    {
        if (!gameManager.isGameOver && !gameManager.isGameWon)
        {
            // Create a 3D movement vector using the X and Y inputs.
            Vector3 movement = new Vector3(movementX, 0.0f, movementY);

            // Apply force to the Rigidbody to move the player.
            playerRb.AddForce(movement * speed);

            // Store Player Position
            Vector3 playerPosition = transform.position;

            if (playerPosition.y < minYPosition)
            {
                ResetPlayerPosition();
            }
        }
        else
        {
            // Calculate the opposite force based on the current velocity.
            Vector3 oppositeForce = -playerRb.velocity * decelerationFactor;

            // Apply the opposite force to decelerate the player.
            playerRb.AddForce(oppositeForce);
        }
    }

    // Reset the player's position to a predefined position.
    void ResetPlayerPosition()
    {
        //  respawn point or any other suitable position.
        // For example, to reset to the origin (0, 0, 0):
        transform.position = respawnPosition;

        // Resets the player's velocity to zero if necessary.
        playerRb.velocity = Vector3.zero;
    }

    private void OnTriggerEnter(Collider other)
    {

        if (!gameManager.isGameOver || !gameManager.isGameWon)
        {
            if (other.gameObject.CompareTag("PickUp"))
            {
                other.gameObject.SetActive(false);
                playerAudio.PlayOneShot(pickupSound, 1f);
                uiManager.IncrementCount(); // Update the count.
                if (gameManager.activePickUps == uiManager.score)
                {
                    gameManager.GameWon();
                    uiManager.ShowWinText();
                }
            }
            else if (other.gameObject.CompareTag("Water") ||
                other.gameObject.CompareTag("Spike"))
            {
                gameManager.GameOver();
            }
        }
    }
}