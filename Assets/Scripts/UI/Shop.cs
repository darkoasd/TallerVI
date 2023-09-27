using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shop : MonoBehaviour
{
    public GameObject panelEntrarTienda;
    public GameObject panelTiendaPrincipal;
    private bool entroRango = false;
    public GameManager gameManager;

    private void Start()
    {
        panelEntrarTienda.SetActive(false);
        if (gameManager == null)
        {
            gameManager = FindObjectOfType<GameManager>();
        }
       
    }
    private void Update()
    {
        if (entroRango == true && Input.GetKeyDown(KeyCode.E))
        {
            TiendaPrincipal();
        }
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            panelEntrarTienda.SetActive(true);
            entroRango = true;
        }
    }
    private void OnTriggerExit(Collider other)
    {
        entroRango = false;
    }
    public void TiendaPrincipal()
    {
        gameManager.SetGameMode(GameManager.GameMode.Shop);
        panelEntrarTienda.SetActive(false);
        panelTiendaPrincipal.SetActive(true);
    }

    public void SalioTienda()
    {
        gameManager.SetGameMode(GameManager.GameMode.Gameplay);
        panelTiendaPrincipal.SetActive(false);
    }


}
