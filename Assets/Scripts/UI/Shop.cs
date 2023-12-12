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
    public Inventory playerInventory;
    public Dictionary<int, Item> catalogoDeItems = new Dictionary<int, Item>();
    private Dictionary<int, int> cantidadCompradaPorItem = new Dictionary<int, int>();
    public List<Item> itemsEnVenta;

    //shop 
    public GameObject escopetaComprar;
    public int precioDeEscopeta;
    public Transform spawnPoint; // El punto donde el objeto será instanciado
    public Button botonDeCompra; // Referencia al botón de compra
    public GameObject playerbars;
    private void Start()
    {
        panelEntrarTienda.SetActive(false);
        if (gameManager == null)
        {
            gameManager = FindObjectOfType<GameManager>();
        }
        playerInventory = FindObjectOfType<Inventory>(); // Asegúrate de que el jugador tenga un componente Inventory
      
    }


    private void Update()
    {
        if (entroRango == true && Input.GetKeyDown(KeyCode.E))
        {
            TiendaPrincipal();
            playerbars.SetActive(false);
        }
    }
    public void ComprarItem(Item itemAComprar)
    {
        if (!cantidadCompradaPorItem.ContainsKey(itemAComprar.itemID))
        {
            cantidadCompradaPorItem[itemAComprar.itemID] = 0;
        }

        if (gameManager.points >= itemAComprar.precio && cantidadCompradaPorItem[itemAComprar.itemID] < itemAComprar.limiteDeCompra)
        {
            gameManager.AddPoints(-itemAComprar.precio);
            playerInventory.AddItem(itemAComprar);
            cantidadCompradaPorItem[itemAComprar.itemID]++;

            // Otras acciones necesarias
        }
        else if (cantidadCompradaPorItem[itemAComprar.itemID] >= itemAComprar.limiteDeCompra)
        {
            Debug.Log("Has alcanzado el límite de compra para este ítem.");
        }
        else
        {
            Debug.Log("No tienes suficientes puntos para comprar este objeto.");
        }

    }
    public void IntercambiarItems(Item itemOfrecido, Item itemDeseado)
    {
        if (playerInventory.HasItem(itemOfrecido) && playerInventory.RemoveItem(itemOfrecido))
        {
            playerInventory.AddItem(itemDeseado);
            // Realiza las actualizaciones necesarias en la UI y otras acciones
        }
        else
        {
            Debug.Log("No tienes el ítem necesario para el intercambio.");
            // Manejo de la situación cuando el jugador no tiene el ítem requerido
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
        playerbars.SetActive(true);
    }


}
