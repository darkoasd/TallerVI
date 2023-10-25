using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI; 

public class Raptor : DinosaurioCarnivoro
{
   
    public bool isTrapped = false;

 
    public void GetTrapped()
    {
        isTrapped = true;
        if (agent != null)
        {
            agent.isStopped = true; // Detiene el NavMeshAgent.
            agent.enabled = false;  // Desactiva el NavMeshAgent para asegurarte de que no se mueva.
        }
    }
    protected override void Update()
    {
        if (!isTrapped) // Si el Raptor no est� atrapado, entonces ejecuta el Update de la clase base.
        {
            base.Update();
        }
        else
        {
            // Aqu� puedes agregar cualquier l�gica adicional que quieras que se ejecute cuando el Raptor est� atrapado.
        }
    }

    public override void Feed(Item item)
    {
        if (isTrapped)
        {
            if (item.itemType == Item.ItemType.ConsumableTameo) // Asumiendo que la carne es del tipo ConsumableTameo.
            {
                // L�gica de alimentaci�n aqu�.
                // Por ejemplo, aumentar el nivel de domesticaci�n.
                domesticationLevel += domesticationThreshold; // Aumenta el nivel de domesticaci�n en funci�n de la cantidad que desees.
                Debug.Log("Raptor alimentado con carne. Nivel de domesticaci�n aumentado.");
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
                // Aqu� puedes agregar cualquier otra l�gica que necesites cuando el jugador est� cerca del Raptor
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
                // Aqu� puedes agregar cualquier otra l�gica que necesites cuando el jugador ya no est� cerca del Raptor
            }
        }
    }
}
