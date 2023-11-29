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
    private bool hasChosenPath = false;
    private bool isCurrentlyAttacking = false; // Variable para rastrear si est� atacando actualmente
    //Attack
    private float attackCooldown = 2f; // Tiempo de espera entre ataques
    private float timeSinceLastAttack = 0f;
    public Collider attackCollider;

    private Animator animator;
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

        Compy[] compysInScene = FindObjectsOfType<Compy>();
        Transform nearestCompyTarget = GetNearestTarget(compysInScene);

        // Encuentra el jugador en la escena (ajusta la etiqueta seg�n tu configuraci�n)
        GameObject playerObject = GameObject.FindGameObjectWithTag("Player");
        if (navMeshAgent.remainingDistance > stoppingDistance && !isCurrentlyAttacking)
        {
            // Si el dinosaurio est� en movimiento y no est� atacando, activa la animaci�n de caminar
            if (this.gameObject.CompareTag("Raptor"))
            {
                animator.SetBool("isWalking", true);
            }

            
        }
        else
        {
            if (this.gameObject.CompareTag("Raptor"))
            {
                animator.SetBool("isWalking", false);
            }
           
        }
        if (playerObject != null)
        {
            Transform playerTransform = playerObject.transform;
            float distanceToPlayer = Vector3.Distance(transform.position, playerTransform.position);
            // L�gica para perseguir al jugador
            if (distanceToPlayer < detectionRange)
            {
                Vector3 directionToPlayer = playerTransform.position - transform.position;
                directionToPlayer.Normalize();
                Vector3 targetPosition = playerTransform.position - directionToPlayer * stoppingDistance;
                navMeshAgent.SetDestination(targetPosition);

                if (!isAttacking && distanceToPlayer < detectionRangeAttack)
                {
                    Debug.Log("Adding player to targets and starting attack.");
                    targets.Add(playerTransform);
                    StartCoroutine(Attack());
                }
                else
                {
                    Debug.Log("Not attacking player. Distance: " + distanceToPlayer + ", Attack Range: " + detectionRangeAttack);
                    SetRandomDestination();
                }
            }
            if (nearestCompyTarget != null)
            {
                float distanceToCompy = Vector3.Distance(transform.position, nearestCompyTarget.position);

                if (distanceToCompy < detectionRange)
                {
                    Vector3 directionToCompy = nearestCompyTarget.position - transform.position;
                    directionToCompy.Normalize();
                    Vector3 targetPosition = nearestCompyTarget.position - directionToCompy * stoppingDistance;
                    navMeshAgent.SetDestination(targetPosition);

                    if (!isAttacking && distanceToCompy < detectionRangeAttack)
                    {
                        targets.Add(nearestCompyTarget);
                        StartCoroutine(Attack());
                    }
                    else
                    {
                        SetRandomDestination();
                    }

                }
                // Si un compy est� m�s cerca y dentro del rango de detecci�n, persigue al compy.
                else if (distanceToCompy < detectionRange)
                {
                    Vector3 directionToCompy = nearestCompyTarget.position - transform.position;
                    directionToCompy.Normalize();
                    Vector3 targetPosition = nearestCompyTarget.position - directionToCompy * stoppingDistance;
                    navMeshAgent.SetDestination(targetPosition);

                    if (!isAttacking && distanceToCompy < detectionRangeAttack)
                    {
                        targets.Add(nearestCompyTarget);
                        StartCoroutine(Attack());
                    }
                    else
                    {
                        SetRandomDestination();
                    }
                }
            }
            else
            {
               // Verifica si el objetivo m�s cercano es un compy y si est� en la lista, y, si lo est�, qu�talo.
    if (nearestCompyTarget != null && targets.Contains(nearestCompyTarget))
    {
        targets.Remove(nearestCompyTarget);
    }
    
    // Verifica si el objetivo m�s cercano es el jugador y si est� en la lista, y, si lo est�, qu�talo.
    if (playerObject != null && targets.Contains(playerTransform))
    {
        targets.Remove(playerTransform);
    }

    if (!navMeshAgent.pathPending && navMeshAgent.remainingDistance < 0.5f)
    {
        // Si el objetivo m�s cercano est� fuera del rango de detecci�n, sigue vagando.
        SetRandomDestination();
    }
            }
        }

    }
    private IEnumerator Attack()
    {
        // Verifica si ya est�s en medio de un ataque
        if (isCurrentlyAttacking)
        {
            yield break; // Sale de la corrutina si ya est�s atacando
        }

        isCurrentlyAttacking = true;
        isAttacking = true;
        navMeshAgent.isStopped = true;
        attackCollider.enabled = true;
        CausarDa�oAlObjetivo();
        Debug.Log("Ataque activado y collider de ataque habilitado.");
        animator.SetBool("isAttacking", true);

        // Realiza acciones de ataque aqu�, como animaciones o efectos de sonido

        yield return new WaitForSeconds(0.5f);

        attackCollider.enabled = false;
        Debug.Log("Collider de ataque desactivado.");
        animator.SetBool("isAttacking", false);
        yield return new WaitForSeconds(attackCooldown);

        navMeshAgent.isStopped = false;
        isAttacking = false;
        isCurrentlyAttacking = false; // Aseg�rate de restablecer esta variable
        Debug.Log("Fin del ataque.");
    }
    private void CausarDa�oAlObjetivo(DinosaurioHerbivoro target = null)
    {
        foreach (Transform enemyTarget in targets)
        {
            if (enemyTarget != null)
            {
                // Intenta da�ar a un DinosaurioHerbivoro
                DinosaurioHerbivoro vidaObjetivoHerbivoro = enemyTarget.GetComponent<DinosaurioHerbivoro>();
                if (vidaObjetivoHerbivoro != null)
                {
                    vidaObjetivoHerbivoro.RecibirDa�o(da�o,gameObject);
                    continue; // Pasa al siguiente objetivo en la lista
                }

                // Intenta da�ar al Jugador
                PlayerMotor vidaObjetivoJugador = enemyTarget.GetComponent<PlayerMotor>();
                if (vidaObjetivoJugador != null)
                {
                    vidaObjetivoJugador.TakeDamage(da�o);
                    continue; // Pasa al siguiente objetivo en la lista
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
        // Elige un punto aleatorio dentro de un radio alrededor del dinosaurio
        Vector3 randomDirection = Random.insideUnitSphere * wanderRadius;
        randomDirection += transform.position;
        NavMeshHit navMeshHit;
        
        if (NavMesh.SamplePosition(randomDirection, out navMeshHit, wanderRadius, 1))
        {
            destination = navMeshHit.position;
            navMeshAgent.SetDestination(destination);
        }
        else
        {
            // Si no se encuentra un punto v�lido, no hagas nada o elige otro punto.
        }

        StartCoroutine(WaitBeforeNextDestination());
    }
    }
    private IEnumerator WaitBeforeNextDestination()
    {
        isWandering = false; // El dinosaurio dejar� de vagar
        yield return new WaitForSeconds(waitTime); // Espera un cierto tiempo
        isWandering = true; // El dinosaurio puede volver a vagar
    }
    private void OnDrawGizmos()
    {
        // Si showDetectionRange es verdadero, muestra el rango de detecci�n como un gizmo en el Editor.
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
