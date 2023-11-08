using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Shop : MonoBehaviour
{
    public GameObject panelEntrarTienda;
    public GameObject panelTiendaPrincipal;

    public GameObject panelCompras;
    private bool entroRango = false;
    public GameManager gameManager;


    //shop 
    public GameObject escopetaComprar;
    public int precioDeEscopeta;
    public Transform spawnPoint; // El punto donde el objeto será instanciado
    public Button botonDeCompra; // Referencia al botón de compra

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
    public void ComprarItem()
    {
        // Verifica si el jugador tiene suficientes puntos
        if (gameManager.points >= precioDeEscopeta)
        {
            // Resta los puntos
            gameManager.AddPoints(-precioDeEscopeta);

            // Instancia el objeto en el punto de spawn
            Instantiate(escopetaComprar, spawnPoint.position, spawnPoint.rotation);
            // Desactiva el botón de compra
            if (botonDeCompra != null)
            {
                botonDeCompra.interactable = false;
            }
            // Aquí puedes agregar cualquier otra lógica que necesites después de la compra
            // Por ejemplo, actualizar la interfaz de usuario, reproducir un sonido, etc.
        }
        else
        {
            Debug.Log("No tienes suficientes puntos para comprar este objeto.");
            // Aquí puedes manejar lo que sucede si el jugador no tiene suficientes puntos
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
    public void AbrirCompras()
    {
        panelCompras.SetActive(true);
    }

    public void SalioTienda()
    {
        gameManager.SetGameMode(GameManager.GameMode.Gameplay);
        panelTiendaPrincipal.SetActive(false);
    }


}
