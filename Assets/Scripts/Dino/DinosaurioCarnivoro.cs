using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class DinosaurioCarnivoro : Dinosaurio
{
    public Transform player;
    private NavMeshAgent navMeshAgent;
    private Vector3 destination;
    private float detectionRange = 10f;
    private float wanderRadius = 10f; // Define el radio en el que el dinosaurio elegirá nuevos destinos

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
        float distanceToPlayer = Vector3.Distance(transform.position, player.position);
        if (distanceToPlayer < detectionRange)
        {
            navMeshAgent.SetDestination(player.position);
        }
        else if (!navMeshAgent.pathPending && navMeshAgent.remainingDistance < 0.5f)
        {
            SetRandomDestination();
        }
    }

    private void SetRandomDestination()
    {
        if (isWandering)
        {
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
}
