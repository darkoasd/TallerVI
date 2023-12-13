using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Shop : MonoBehaviour
{
    [System.Serializable]
    public class Intercambio
    {
        public Item itemOfrecido;
        public int cantidadOfrecida;
        public Item itemDeseado;
    }
    public List<Intercambio> intercambiosDisponibles;
    public GameObject panelEntrarTienda;
    public GameObject panelTiendaPrincipal;
    public GameObject panelIntercambio;
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
    public void RealizarIntercambio(int indiceIntercambio)
    {
        if (indiceIntercambio < 0 || indiceIntercambio >= intercambiosDisponibles.Count)
        {
            Debug.LogError("Índice de intercambio fuera de rango.");
            return;
        }

        Intercambio intercambio = intercambiosDisponibles[indiceIntercambio];
        if (!playerInventory.IntercambiarPorCantidad(intercambio.itemOfrecido, intercambio.cantidadOfrecida, intercambio.itemDeseado))
        {
            Debug.Log("Intercambio fallido. Verifica si tienes suficientes ítems para el intercambio.");
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

    public void IntercambiarPorCantidad(Item itemOfrecido, int cantidadOfrecida, Item itemDeseado)
    {
        if (!playerInventory.IntercambiarPorCantidad(itemOfrecido, cantidadOfrecida, itemDeseado))
        {
            Debug.Log("Intercambio fallido. Verifica si tienes suficientes ítems para el intercambio.");
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
    public void AbrirIntercambios()
    {
        panelIntercambio.SetActive(true);
    }

    public void SalioTienda()
    {
        gameManager.SetGameMode(GameManager.GameMode.Gameplay);
        panelTiendaPrincipal.SetActive(false);
        playerbars.SetActive(true);
    }


}
