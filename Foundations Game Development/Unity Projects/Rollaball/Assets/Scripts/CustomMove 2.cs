using UnityEngine;

public class CustomMove : MonoBehaviour
{
    public Vector3 moveDirection = Vector3.right; // Default direction is right.
    public float moveSpeed = 2.0f; // Default speed is 2 units per second.

    private Vector3 startPosition;
    private Vector3 targetPosition;
    private bool movingRight = true;
    //private GameManager gameManager; 

    void Start()
    {
        startPosition = transform.position;
        targetPosition = startPosition + moveDirection;
        //gameManager = GameObject.Find("GameManager").GetComponent<GameManager>();
    }

    void Update()
    {
        
        // Calculate the target position based on the movement direction.
        if (movingRight)
        {
            targetPosition = startPosition + moveDirection;
        }
        else
        {
            targetPosition = startPosition;
        }

        // Move the object towards the target position.
        transform.position = Vector3.MoveTowards(transform.position, targetPosition, moveSpeed * Time.deltaTime);

        // Check if the object has reached the target position.
        if (transform.position == targetPosition)
        {
            // Toggle the movement direction.
            movingRight = !movingRight;
        }
    }
}
