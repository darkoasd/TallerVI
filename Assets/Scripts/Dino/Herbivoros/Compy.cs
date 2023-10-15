using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using UnityEngine.AI;

public class Compy :DinosaurioHerbivoro
{
    public float flightEnergy = 10.0f; // Energía de vuelo inicial del Compy
    public Transform playerTransform;
    public float followDistance = 2f;
    public GameObject pickupTextCanvas; // Asigna tu Canvas con el texto en el Inspector
    public bool isPlayerNearby = false;

    protected override void Start()
    {
        base.Start();
    }
    public void UseFlightEnergy(float amount)
    {
        flightEnergy -= amount;
        if (flightEnergy <= 0)
        {
            flightEnergy = 0;
            // Código para manejar cuando la energía de vuelo se agota, por ejemplo, soltar el Compy
        }
    }
    protected override void Update()
    {
        base.Update();

        if (domesticationLevel >= domesticationThreshold)
        {
            Debug.Log("Compy tiene suficientes niveles de domesticación");

            if (!isFollowingPlayer)
            {
                Debug.Log("Compy no está siguiendo al jugador");

                if (EspeciesDomesticadas.TryGetValue(typeof(Compy).Name, out var domesticado) && domesticado == this)
                {
                    Debug.Log("¡El Compy ha sido domesticado!");
                    isFollowingPlayer = true;
                    FollowPlayer();
                    Debug.Log("Compy está siguiendo al jugador");
                }
                else
                {
                    Debug.Log("Ya existe un Compy domesticado en el diccionario");
                }
            }
        }
        if (isFollowingPlayer)
        {
            // Verifica que playerTransform no sea null y que NavMeshAgent esté activo antes de establecer el destino
            if (playerTransform != null && agent.enabled)
            {
                agent.SetDestination(playerTransform.position);
            }
        }
    }

    private void FollowPlayer()
    {
        Debug.Log("Compy ahora está siguiendo al jugador");
        if (agent != null && agent.enabled && playerTransform != null)
        {
            agent.stoppingDistance = followDistance;
            agent.SetDestination(playerTransform.position);
      
        }
       
    }

    public override void Feed(Item item)
    {
        if (EspeciesDomesticadas.ContainsKey(typeof(Compy).Name))
        {
            Debug.Log("Ya hay un Compy domesticado. No se puede domesticar otro.");
            return; // Si ya hay un Compy domesticado, no permitir la domesticación adicional
        }
        base.Feed(item); // Llama al método Feed de la clase base

        // Si el Compy ha sido domesticado y no está siguiendo al jugador
        if (domesticationLevel >= domesticationThreshold && !isFollowingPlayer)
        {
            // Cambiar el valor de isFollowingPlayer a true
            isFollowingPlayer = true;
        }
    }

    // Este método será llamado cuando el jugador entre en el área de trigger del Compy
    public void HandleTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            PlayerMotor player = other.GetComponent<PlayerMotor>();
            if (player != null && !player.nearbyCompy.Contains(this))
            {
                player.nearbyCompy.Add(this);

                // Solo muestra el texto si el Compy está domesticado
                if (domesticationLevel >= domesticationThreshold)
                {
                    pickupTextCanvas.SetActive(true);
                }

                isPlayerNearby = true;
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
                player.nearbyCompy.Remove(this);
                pickupTextCanvas.SetActive(false);
                isPlayerNearby = false;
            }
        }
    }
    private void OnDestroy()
    {
        // Si este Compy está siendo seguido, lo eliminamos de EspeciesDomesticadas al ser destruido
        if (isFollowingPlayer)
        {
            EspeciesDomesticadas.Remove(typeof(Compy).Name);
        }
    }
    public void BePickedUp(Transform playerNeckTransform)
    {
        transform.SetParent(playerNeckTransform);
        transform.localPosition = Vector3.zero; // O ajusta según sea necesario
        transform.localRotation = Quaternion.identity; // O ajusta según sea necesario
        isFollowingPlayer = false;
        agent.enabled = false; // Desactiva el NavMeshAgent mientras es llevado

    }

    public void BeDroppedOrFollow()
    {
        // Configura el Compy para ser soltado o para seguir al jugador
        transform.SetParent(null); // Elimina el parentesco para que no siga al jugador
        agent.enabled = true; // Reactiva el NavMeshAgent para que el Compy pueda moverse de nuevo
        isFollowingPlayer = true; // Si quieres que el Compy siga al jugador después de ser soltado
    }
}
