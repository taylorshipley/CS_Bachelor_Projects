using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotator : MonoBehaviour
{

    // Update is called once per frame
    void Update()
    {
        // Rotates the object by each axis
        transform.Rotate(new Vector3(15, 30, 45) * Time.deltaTime);
    }
}
