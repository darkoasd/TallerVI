using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Events;
using UnityEngine.UI;
public class Dinosaurio : MonoBehaviour
{
    // Stats Principales
    public float vida;
    public float vidaMaxima;
    public float da�o;
    public float velocidad;
    public int pointsValue = 10;
    // Domesticacion
    protected NavMeshAgent agent;
    public int domesticationLevel = 0;
    public int domesticationThreshold = 3; // Puedes ajustar este valor en cada tipo de dinosaurio
    //Componentes
    public GameObject itemDrop;
    public Transform spawnItem;
    private bool detachObjecjt;
    
    //UI
    public GameObject healthBarUi;
    public GameObject tameBarUi;
    public Slider healthBar;
    public Slider tameBar;
    //Sounds
    public AudioClip sonidoAlimentacion; // El sonido de alimentar al dinosaurio
    private AudioSource audioSource; // El componente que reproducir� el sonido
    public ParticleSystem sistemaParticulasDa�o;


    public UnityEvent<int> onDeath; // Aseg�rate de que el evento pueda llevar un int como par�metro
    [System.Serializable]
    public class OnDomesticationChanged : UnityEvent<float> { }
    public OnDomesticationChanged onDomesticationChanged;

    // Diccionario para llevar registro de las especies domesticadas
    public static Dictionary<string, Dinosaurio> EspeciesDomesticadas = new Dictionary<string, Dinosaurio>();

    protected virtual void Update()
    {
        if(detachObjecjt == true)
        {
            Instantiate(itemDrop, spawnItem);
            spawnItem.parent = null;
        }
        // Imprimir el contenido del diccionario
        foreach (var entry in EspeciesDomesticadas)
        {
            Debug.Log(entry.Key + ": " + entry.Value);
        }
        healthBar.value = CalculatedHealth();
        tameBar.value = CalculatedTame();
        if (domesticationLevel < domesticationThreshold)
        {
            tameBarUi.SetActive(true);
        }
        if (domesticationLevel == domesticationThreshold)
        {
            tameBarUi.SetActive(false);
        }

        if (vida < vidaMaxima)
        {
            healthBarUi.SetActive(true);
        }
       
        if (vida > vidaMaxima)
        {
            vida = vidaMaxima;
        }
        if (vida <= 0)
        {
            Morir(gameObject);
        }
    }

    public float CalculatedHealth()
    {
        return vida / vidaMaxima;
    }

    public float CalculatedTame()
    {
        return domesticationLevel;
    }

    // Este m�todo ser� llamado cuando el dinosaurio es alimentado
    public virtual void Feed(Item item)
    {
        Debug.Log("Alimentando al dinosaurio con " + item.itemName);
        domesticationLevel++;
        Debug.Log(GetType().Name + " nivel de domesticaci�n: " + domesticationLevel);

        if (domesticationLevel >= domesticationThreshold)
        {
            EspeciesDomesticadas[GetType().Name] = this;
            Debug.Log("A�adiendo " + GetType().Name + " al diccionario de EspeciesDomesticadas");
        }
        // Reproduce el sonido de alimentaci�n
        if (audioSource != null && sonidoAlimentacion != null)
        {
            audioSource.PlayOneShot(sonidoAlimentacion);
        }
        // Luego de incrementar el nivel de domesticaci�n, disparamos el evento
        onDomesticationChanged.Invoke(domesticationLevel);
    }

    // Inicializa el agente NavMesh y cualquier otra configuraci�n com�n
    protected virtual void Start()
    {
        onDeath = new UnityEvent<int>();
        GameManager gameManager = FindObjectOfType<GameManager>();
        if (gameManager != null)
        {
            gameManager.SubscribeToDinosaurDeath(this);
            Debug.Log("Subscribed to dinosaur death event.");
        }
        else
        {
            Debug.Log("GameManager not found.");
        }
        audioSource = gameObject.AddComponent<AudioSource>();
        audioSource.playOnAwake = false; // No queremos que el sonido se reproduzca autom�ticamente al inicio
        vida = vidaMaxima;
        healthBar.value = CalculatedHealth();
        tameBar.value = CalculatedTame();
        agent = GetComponent<NavMeshAgent>();
        agent.speed = velocidad;
    }

    // M�todo para recibir da�o
    public virtual void RecibirDa�o(float cantidad, GameObject atacante)
    {

        vida -= cantidad;
        Debug.Log(gameObject.name + " recibi� da�o. Vida restante: " + vida);

        // Activa el sistema de part�culas cuando el dinosaurio recibe da�o
        if (sistemaParticulasDa�o != null)
        {
            sistemaParticulasDa�o.Play();
        }
        else
        {
            Debug.LogWarning("Referencia a sistema de part�culas no establecida en Dinosaurio.");
        }

        if (vida <= 0)
        {
            Morir(atacante);
        }
    }

        // M�todo para manejar la muerte del dinosaurio
        protected virtual void Morir(GameObject atacante)
        {
            Debug.Log(gameObject.name + " ha muerto. Atacante: " + atacante.name);
            // Si este dinosaurio estaba domesticado, removerlo del diccionario
            EspeciesDomesticadas.Remove(GetType().Name);
        if (spawnItem != null && itemDrop != null)
        {
            Instantiate(itemDrop, spawnItem.position, spawnItem.rotation);
        }


        // Verifica si el atacante es el jugador antes de disparar el evento
        if (atacante != null && atacante.CompareTag("Player"))
            {
                onDeath.Invoke(pointsValue); // Pasa el valor de los puntos al evento
            }            
            // Destruir el objeto del dinosaurio
            Destroy(gameObject);
        }
}
