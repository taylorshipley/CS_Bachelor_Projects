using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DifficultyBUtton : MonoBehaviour
{
    private Button button;
    private GameManager gameManager;
    public int difficulty;

    // Start is called before the first frame update
    void Start()
    {
        gameManager = GameObject.Find("Game Manager").GetComponent<GameManager>();
        button = GetComponent<Button>();
        button.onClick.AddListener(SetDifficulty);
        
    }

    void SetDifficulty()
    {
        gameManager.StartGame(difficulty);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
