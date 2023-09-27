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

    // Domesticacion
    protected NavMeshAgent agent;
    public int domesticationLevel = 0;
    public int domesticationThreshold = 3; // Puedes ajustar este valor en cada tipo de dinosaurio

    //UI
    public GameObject healthBarUi;
    public GameObject tameBarUi;
    public Slider healthBar;
    public Slider tameBar;

    //bool
    
    [System.Serializable]
    public class OnDomesticationChanged : UnityEvent<float> { }
    public OnDomesticationChanged onDomesticationChanged;

    // Diccionario para llevar registro de las especies domesticadas
    public static Dictionary<string, Dinosaurio> EspeciesDomesticadas = new Dictionary<string, Dinosaurio>();

    protected virtual void Update()
    {
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
        if (vida <= 0)
        {
            Morir();
        }
        if (vida > vidaMaxima)
        {
            vida = vidaMaxima;
        }
    }

    float CalculatedHealth()
    {
        return vida / vidaMaxima;
    }

    float CalculatedTame()
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

        // Luego de incrementar el nivel de domesticaci�n, disparamos el evento
        onDomesticationChanged.Invoke(domesticationLevel);
    }

    // Inicializa el agente NavMesh y cualquier otra configuraci�n com�n
    protected virtual void Start()
    {
        vida = vidaMaxima;
        healthBar.value = CalculatedHealth();
        tameBar.value = CalculatedTame();
        agent = GetComponent<NavMeshAgent>();
        agent.speed = velocidad;
    }

    // M�todo para recibir da�o
    public virtual void RecibirDa�o(float cantidad)
    {
        vida -= cantidad;
        if (vida <= 0)
        {
            Morir();
        }
    }

    // M�todo para manejar la muerte del dinosaurio
    protected virtual void Morir()
    {
        // Aqu� va el c�digo para manejar la muerte del dinosaurio

        // Si este dinosaurio estaba domesticado, removerlo del diccionario
        EspeciesDomesticadas.Remove(GetType().Name);

        // Destruir el objeto del dinosaurio
        Destroy(gameObject);
    }
}
