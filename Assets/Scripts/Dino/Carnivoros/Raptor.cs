using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI; 

public class Raptor : DinosaurioCarnivoro
{
    public float followDistance = 3.0f; 
    public bool isTrapped = false;
    public int domesticationIncreasePerFeed = 2; // Aumento por cada alimento
    private Transform playerTransform; // Referencia al jugador
    public void GetTrapped()
    {
        isTrapped = true;
        if (agent != null)
        {
            agent.isStopped = true; // Detiene el NavMeshAgent.
            agent.enabled = false;  // Desactiva el NavMeshAgent para asegurarte de que no se mueva.
        }
    }
    protected override void Start()
    {
        base.Start();
        playerTransform = GameObject.FindGameObjectWithTag("Player").transform; // Asume que el jugador tiene la etiqueta "Player"
    }
    protected override void Update()
    {

        healthBar.value = CalculatedHealth();
        tameBar.value = CalculatedTame();
        if (!isTrapped) // Si el Raptor no está atrapado, entonces ejecuta el Update de la clase base.
        {
            base.Update();
        }
        else
        {
            if (IsDomesticated())
            {
                FollowPlayer();
            }
        }
    }

    public override void Feed(Item item)
    {
        if (isTrapped)
        {
            if (item.itemType == Item.ItemType.ConsumableTameoRaptor) // Asumiendo que la carne es del tipo ConsumableTameo.
            {
                // Lógica de alimentación aquí.
                // Por ejemplo, aumentar el nivel de domesticación.
                domesticationLevel += domesticationIncreasePerFeed;  // Aumenta el nivel de domesticación en función de la cantidad que desees.
                Debug.Log("Raptor alimentado con carne. Nivel de domesticación aumentado.");
            }
            else
            {
                Debug.Log("El Raptor solo puede ser domesticado con carne.");
            }
        }
        else
        {
            Debug.Log("El Raptor debe estar atrapado para ser alimentado.");
        }
    }
    public void HandleTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            PlayerMotor player = other.GetComponent<PlayerMotor>();
            if (player != null && !player.nearbyRaptor.Contains(this))
            {
                player.nearbyRaptor.Add(this);
                // Aquí puedes agregar cualquier otra lógica que necesites cuando el jugador esté cerca del Raptor
            }
        }
    }

    public void HandleTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            PlayerMotor player = other.GetComponent<PlayerMotor>();
            if (player != null)
            {
                player.nearbyRaptor.Remove(this);
                // Aquí puedes agregar cualquier otra lógica que necesites cuando el jugador ya no esté cerca del Raptor
            }
        }
    }
    private bool IsDomesticated()
    {
        return domesticationLevel >= domesticationThreshold;
    }

    private void FollowPlayer()
    {
        if (agent != null && playerTransform != null)
        {
            agent.enabled = true;
            agent.isStopped = false;

            // Calcula la dirección desde el jugador hacia el Raptor.
            Vector3 directionToRaptor = (transform.position - playerTransform.position).normalized;

            // Calcula el punto al que el Raptor debe dirigirse, que está a 'followDistance' unidades del jugador.
            Vector3 targetPosition = playerTransform.position + directionToRaptor * followDistance;

            agent.SetDestination(targetPosition);
        }
    }
}
