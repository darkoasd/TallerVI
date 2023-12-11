using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class DinosaurioCarnivoro : Dinosaurio
{
    public List<Transform> targets;
    [SerializeField] private NavMeshAgent navMeshAgent;
    private Vector3 destination;
    public float detectionRange = 10f;
    public float detectionRangeAttack = 2f;
    public float wanderRadius = 10f; // radioPatrulla
    public float stoppingDistance = 2.0f;
    public bool showDetectionRange = true;
    DinosaurioHerbivoro dinosaurioHerbivoro;
    public float waitTime = 5f;
    //bool
    private bool isWandering = true;
     bool isAttacking = false;
    protected bool isRunningAway = false;
    private bool hasChosenPath = false;
    public bool isCurrentlyAttacking = false; // Variable para rastrear si está atacando actualmente
    //Attack
    private float attackCooldown = 2f; // Tiempo de espera entre ataques
    private float timeSinceLastAttack = 0f;
    public Collider attackCollider;
    public bool isBeingRidden = false;
    public Animator animator;


    private float timeSinceLastWander = 0f;
    private float wanderInterval = 5f; // Intervalo de tiempo para establecer un nuevo destino

    protected override void Start()
    {
        base.Start(); 
        navMeshAgent = GetComponent<NavMeshAgent>();
        attackCollider.enabled = false;

        animator = GetComponent<Animator>();
    }
   
    protected override void Update()
    {
        base.Update();
        targets.RemoveAll(target => target == null);
        timeSinceLastAttack += Time.deltaTime;
        GameObject playerObject = GameObject.FindGameObjectWithTag("Player");
        Compy[] compysInScene = FindObjectsOfType<Compy>();
        Transform nearestCompyTarget = GetNearestTarget(compysInScene);
        bool isMoving = navMeshAgent.velocity.magnitude > 0.1f;
        animator.SetBool("isWalking", isMoving && !isCurrentlyAttacking);

        // Manejo de la lógica de seguimiento y ataque
        HandleTargetingAndAttack(playerObject, nearestCompyTarget);

        // Actualización para establecer un destino aleatorio regularmente
        timeSinceLastWander += Time.deltaTime;
        if (timeSinceLastWander >= wanderInterval && !isCurrentlyAttacking && !isBeingRidden)
        {
            SetRandomDestination();
            timeSinceLastWander = 0f;
        }
        if (!isMoving && !isCurrentlyAttacking)
        {
            animator.SetBool("isIdle", true);
            animator.SetBool("isWalking", false);
            animator.SetBool("isAttacking", false);
        }


    }
    private void HandleTargetingAndAttack(GameObject playerObject, Transform nearestCompyTarget)
    {
        Debug.Log("HandleTargetingAndAttack llamado");
        if (isBeingRidden || isCurrentlyAttacking)
        {
            Debug.Log("Retorno anticipado: isBeingRidden = " + isBeingRidden + ", isCurrentlyAttacking = " + isCurrentlyAttacking);
            return; // Detiene la ejecución si el dinosaurio está siendo montado o atacando
        }

        // Lógica para perseguir y atacar al jugador
        if (playerObject != null)
        {
            Transform playerTransform = playerObject.transform;
            float distanceToPlayer = Vector3.Distance(transform.position, playerTransform.position);
            Debug.Log("Distancia al jugador: " + distanceToPlayer);
            Raptor raptorComponent = GetComponent<Raptor>();
            if (raptorComponent == null || !raptorComponent.isDomesticated)
            {
                Debug.Log("Raptor es null o no está domesticado");
                if (distanceToPlayer < detectionRange && distanceToPlayer > detectionRangeAttack)
                {
                    Debug.Log("Perseguir al jugador");
                    PursueTarget(playerTransform, distanceToPlayer);
                }
                else if (distanceToPlayer <= detectionRangeAttack && !isAttacking)
                {
                    Debug.Log("Iniciar ataque al jugador");
                    targets.Add(playerTransform);
                    StartCoroutine(Attack());
                }
            }
            else
            {
                Debug.Log("Raptor está domesticado, no perseguirá ni atacará al jugador");
            }
        }
        else
        {
            Debug.Log("playerObject es null");
        }


        // Lógica para perseguir y atacar a los Compy
        if (nearestCompyTarget != null)
        {
            float distanceToCompy = Vector3.Distance(transform.position, nearestCompyTarget.position);
            if (distanceToCompy < detectionRange && distanceToCompy > detectionRangeAttack)
            {
                PursueTarget(nearestCompyTarget, distanceToCompy);
            }
            else if (distanceToCompy <= detectionRangeAttack && !isAttacking)
            {
                targets.Add(nearestCompyTarget);
                StartCoroutine(Attack());
            }
            if (nearestCompyTarget != null && targets.Contains(nearestCompyTarget))
            {
                targets.Remove(nearestCompyTarget);
            }
        }

    }

    private void PursueTarget(Transform target, float distance)
    {
        if (distance > detectionRangeAttack)
        {
            // Perseguir al objetivo
            Vector3 directionToTarget = target.position - transform.position;
            directionToTarget.Normalize();
            Vector3 targetPosition = target.position - directionToTarget * stoppingDistance;
            navMeshAgent.SetDestination(targetPosition);
            animator.SetBool("isWalking", true);
            animator.SetBool("isIdle", false);
            animator.SetBool("isAttacking", false);
        }
        else if (!isAttacking)
        {
            
        }
    }
    private IEnumerator Attack()
    {
        // Verifica si ya estás en medio de un ataque
        if (isCurrentlyAttacking)
        {
            yield break; // Sale de la corrutina si ya estás atacando
        }

        isCurrentlyAttacking = true;
        isAttacking = true;
        navMeshAgent.isStopped = true;
        CausarDañoAlObjetivo();
        attackCollider.enabled = true;
       
        Debug.Log("Ataque activado y collider de ataque habilitado.");
        animator.SetBool("isAttacking", true);
        animator.SetBool("isWalking", false);
        animator.SetBool("isIdle", false);

        // Realiza acciones de ataque aquí, como animaciones o efectos de sonido

        yield return new WaitForSeconds(0.5f);

        attackCollider.enabled = false;
        Debug.Log("Collider de ataque desactivado.");
        animator.SetBool("isAttacking", false);

        yield return new WaitForSeconds(attackCooldown);

        navMeshAgent.isStopped = false;
        isAttacking = false;
        isCurrentlyAttacking = false; // Asegúrate de restablecer esta variable
        Debug.Log("Fin del ataque.");
    }
    private void CausarDañoAlObjetivo(DinosaurioHerbivoro target = null)
    {
        foreach (Transform enemyTarget in targets)
        {
            if (enemyTarget != null)
            {
                // Intenta dañar a un DinosaurioHerbivoro
                DinosaurioHerbivoro vidaObjetivoHerbivoro = enemyTarget.GetComponent<DinosaurioHerbivoro>();
                if (vidaObjetivoHerbivoro != null)
                {
                    vidaObjetivoHerbivoro.RecibirDaño(daño, gameObject);
                    continue; // Pasa al siguiente objetivo en la lista
                }

                // Intenta dañar al Jugador
                PlayerMotor vidaObjetivoJugador = enemyTarget.GetComponent<PlayerMotor>();
                if (vidaObjetivoJugador != null)
                {
                    vidaObjetivoJugador.TakeDamage(daño);
                    continue; // Pasa al siguiente objetivo en la lista
                }
                Raptor vidaObjetivoRaptor = enemyTarget.GetComponent<Raptor>();
                if (vidaObjetivoRaptor != null && enemyTarget.CompareTag("RaptorDomesticado"))
                {
                    vidaObjetivoRaptor.TakeDamage(daño);
                    continue;
                }

            }
        }
    }
   
  
    
    private Transform GetNearestTarget(Compy[] compys)
    {
        Transform nearestTarget = null;
        float nearestDistance = detectionRange;

        foreach (Compy compy in compys)
        {
            float distanceToTarget = Vector3.Distance(transform.position, compy.transform.position);

            if (distanceToTarget < nearestDistance)
            {
                nearestDistance = distanceToTarget;
                nearestTarget = compy.transform;
            }
        }

        return nearestTarget;
    }
    private void SetRandomDestination()
    {
        if (isWandering && !isCurrentlyAttacking)
        {
            Vector3 randomDirection = Random.insideUnitSphere * wanderRadius;
            randomDirection += transform.position;
            NavMeshHit navMeshHit;

            // Intenta encontrar una posición válida en el NavMesh dentro del radio especificado
            if (NavMesh.SamplePosition(randomDirection, out navMeshHit, wanderRadius, NavMesh.AllAreas))
            {
                destination = navMeshHit.position;
                navMeshAgent.SetDestination(destination);
            }
            else
            {
                // Si no se encuentra un punto válido, intenta de nuevo
                SetRandomDestination();
            }

            StartCoroutine(WaitBeforeNextDestination());
        }
    }

    private IEnumerator WaitBeforeNextDestination()
    {
        isWandering = false; // El dinosaurio dejará de vagar
        yield return new WaitForSeconds(waitTime); // Espera un cierto tiempo
        isWandering = true; // El dinosaurio puede volver a vagar
    }
    private void OnDrawGizmos()
    {
        // Si showDetectionRange es verdadero, muestra el rango de detección como un gizmo en el Editor.
        if (showDetectionRange)
        {
            Gizmos.color = Color.blue;
            Gizmos.DrawWireSphere(transform.position, detectionRange);

            // Muestra el rango de ataque en color rojo.
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, detectionRangeAttack);
        }
    }

}
