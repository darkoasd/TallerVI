using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using UnityEngine.AI;

public class Compy :DinosaurioHerbivoro
{
    public Transform playerTransform;
    public float followDistance = 2f;
    

    protected override void Start()
    {
        base.Start();
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
            agent.SetDestination(playerTransform.position);
        }
    }

    private void FollowPlayer()
    {
        Debug.Log("Compy ahora está siguiendo al jugador");
        agent.stoppingDistance = followDistance;
        agent.SetDestination(playerTransform.position);
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

}
