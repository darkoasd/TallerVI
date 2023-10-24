using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour
{
    

    public PlayerMotor player;

    public GameObject enciclopediaPanel;
    public GameObject menuGameOver;
    public GameObject menuPausaUI;
    //Inventory
   
    public GameObject inventario;
    private bool isInventoryOpen = false;
    private bool isPaused = false;
    

    public GameMode currentMode = GameMode.Gameplay;
    public enum GameMode { Gameplay, Shop, Inventory, Pause, GameOver, Enciclopedia }
    void Start()
    {
        Resume();  // Aseg�rate de que el juego comienza con el men� de pausa desactivado y el cursor bloqueado.
    }
    public void SetGameMode(GameMode newMode)
    {
        currentMode = newMode;

        switch (currentMode)
        {
            case GameMode.Gameplay:
                // Configuraci�n para cuando est�s jugando normalmente.
                Time.timeScale = 1f;
                Cursor.lockState = CursorLockMode.Locked;
                Cursor.visible = false;
                break;

            case GameMode.Shop:
                // Configuraci�n para cuando est�s en la tienda.
                Time.timeScale = 0f;
                Cursor.lockState = CursorLockMode.None;
                Cursor.visible = true;
                break;

            case GameMode.Inventory:
                // Configuraci�n para cuando el inventario est� abierto.
                Time.timeScale = 0f;
                Cursor.lockState = CursorLockMode.None;
                Cursor.visible = true;
                break;

            case GameMode.Pause:
                // Configuraci�n para cuando el juego est� pausado.
                Time.timeScale = 0f;
                Cursor.lockState = CursorLockMode.None;
                Cursor.visible = true;
                break;

            case GameMode.GameOver:
                // Configuraci�n para cuando el juego est� pausado.
                Time.timeScale = 0f;
                Cursor.lockState = CursorLockMode.None;
                Cursor.visible = true;
                break;
            case GameMode.Enciclopedia:
                // Configuraci�n para cuando el juego est� pausado.
                Time.timeScale = 0f;
                Cursor.lockState = CursorLockMode.None;
                Cursor.visible = true;
                break;
        }
    }
    void Update()
    {
        HandleInventoryInput();
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if (isPaused)
            {
                Resume();
            }
            else
            {
                Pause();
            }
        }
        if (Input.GetKeyDown(KeyCode.O))
        {
            SetGameMode(GameMode.Enciclopedia);
            abrirEnclicopedia();

        }
        else
        {
            
        }
    }
    public void abrirEnclicopedia()
    {
        enciclopediaPanel.SetActive(true);
    }
    public void cerrarEnclicopedia()
    {
        enciclopediaPanel.SetActive(false);
        Resume();
    }

    public void Resume()
    {
        menuPausaUI.SetActive(false);
        isPaused = false;
        SetGameMode(GameMode.Gameplay);
    }
    void HandleInventoryInput()
    {
        if (Input.GetKeyDown(KeyCode.I))
        {
            isInventoryOpen = !isInventoryOpen; // Cambia el estado de isInventoryOpen
            inventario.SetActive(isInventoryOpen); // Activa o desactiva el UI de inventario seg�n el estado.

            if (isInventoryOpen)
            {
                SetGameMode(GameMode.Inventory);
            }
            else
            {
                SetGameMode(GameMode.Gameplay);
            }
        }
    }

   
    void Pause()
    {
        menuPausaUI.SetActive(true);
        isPaused = true;
        SetGameMode(GameMode.Pause);
    }

    public void LoadMenu()
    {
        Time.timeScale = 1f;
        SceneManager.LoadScene("Menu");
    }

    public void QuitGame()
    {
        Debug.Log("Saliendo del juego...");
        Application.Quit();
    }
    public void GameOver()
    {
        menuGameOver.SetActive(true);
        Destroy(player);
        SetGameMode(GameMode.GameOver);
    }
   
   
    public void RecargarNivel1()
    {
        print("RECargoNivel");
        SceneManager.LoadScene("Tutorial");
        SetGameMode(GameMode.Gameplay);
    }
}
