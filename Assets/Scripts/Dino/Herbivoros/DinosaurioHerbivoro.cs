using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class DinosaurioHerbivoro : Dinosaurio
{
    private NavMeshAgent navMeshAgent;
    private Vector3 destination;

    protected bool isFollowingPlayer = false;

    public float wanderRadius = 10f; // Define el radio en el que el dinosaurio elegirá nuevos destinos
    private bool isWandering = true;
    public float waitTime = 5f;
    protected override void Start()
    {
        base.Start(); // Llama al método Start de la clase base
        navMeshAgent = GetComponent<NavMeshAgent>();
        SetRandomDestination();
    }

    protected override void Update()
    {

        base.Update();

        if (!isFollowingPlayer && navMeshAgent != null && navMeshAgent.enabled && !navMeshAgent.pathPending && navMeshAgent.remainingDistance < 0.5f)
        {
            SetRandomDestination();
        }
    }

    private void SetRandomDestination() 
    {
        if (isWandering)
        {
            Debug.Log("Dinosaurio Herbívoro está estableciendo un nuevo destino");
            // Elige un punto aleatorio dentro de un radio alrededor del dinosaurio
            Vector3 randomDirection = Random.insideUnitSphere * wanderRadius;
            randomDirection += transform.position;
            NavMeshHit navMeshHit;
            NavMesh.SamplePosition(randomDirection, out navMeshHit, wanderRadius, 1);
            destination = navMeshHit.position;

            navMeshAgent.SetDestination(destination);

            StartCoroutine(WaitBeforeNextDestination());
        }

    }
    private IEnumerator WaitBeforeNextDestination()
    {
        isWandering = false; // El dinosaurio dejará de vagar
        yield return new WaitForSeconds(waitTime); // Espera un cierto tiempo
        isWandering = true; // El dinosaurio puede volver a vagar
    }
    public override void Feed(Item item)
    {
        base.Feed(item); // Llama al método Feed de la clase base

        // Si el dinosaurio ha sido domesticado y no está siguiendo al jugador
        if (domesticationLevel >= domesticationThreshold && !isFollowingPlayer)
        {
            // Cambiar el valor de isFollowingPlayer a true
            isFollowingPlayer = true;
        }
    }
   
}

