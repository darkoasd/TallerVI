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
        if (!isTrapped) // Si el Raptor no está atrapado, entonces ejecuta el Update de la clase base.
        {
            base.Update();
        }
        else
        {
            // Aquí puedes agregar cualquier lógica adicional que quieras que se ejecute cuando el Raptor esté atrapado.
        }
    }

    public override void Feed(Item item)
    {
        if (isTrapped)
        {
            if (item.itemType == Item.ItemType.ConsumableTameo) // Asumiendo que la carne es del tipo ConsumableTameo.
            {
                // Lógica de alimentación aquí.
                // Por ejemplo, aumentar el nivel de domesticación.
                domesticationLevel += domesticationThreshold; // Aumenta el nivel de domesticación en función de la cantidad que desees.
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
}
