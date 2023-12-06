using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI; 

public class Raptor : DinosaurioCarnivoro
{
    public float followDistance = 3.0f;
    
    public float healthThresholdToRun = 5.0f;
    public int domesticationIncreasePerFeed = 2; // Aumento por cada alimento
    private Transform playerTransform; // Referencia al jugador
    public bool isFollowingPlayer = false;
    private Rigidbody raptorRigidbody;
    private GameObject player; // Referencia al jugador
    //Movimiento
    public float turnSpeed = 100f; //velocidad de Giro
    public float moveSpeed = 5f;
    public float cantidadCura = 7;
    //Domesticacion 

    public bool isDomesticated = false;
  
    public Transform mountPoint;



    //UI
    private GameObject cinturonSlots;
    private GameObject playerBars;

    protected override void Start()
    {
        base.Start();

        playerTransform = GameObject.FindGameObjectWithTag("Player").transform; // Asume que el jugador tiene la etiqueta "Player"
        cinturonSlots = GameObject.FindGameObjectWithTag("PlayerUI");
        playerBars = GameObject.FindGameObjectWithTag("PlayerGameUI");
        raptorRigidbody = GetComponent<Rigidbody>();
    }
    protected override void Update()
    {
        base.Update();
        healthBar.value = CalculatedHealth();
        tameBar.value = CalculatedTame();
        if (isBeingRidden && Input.GetKeyDown(KeyCode.E))
        {
            DismountRaptor();
            playerBars.SetActive(true);
            cinturonSlots.SetActive(true);
        }
        if (vida <= healthThresholdToRun && !IsDomesticated())
        {
            RunAway();
        }
        else if (IsDomesticated())
        {
            FollowPlayer();
        }

        if (isBeingRidden)
        {
            playerBars.SetActive(false);
            cinturonSlots.SetActive(false);
            HandleMountedMovement();
            HandleMountedAttack();

            // Verifica si el Raptor se está moviendo y actualiza el Animator
            bool isMoving = Mathf.Abs(Input.GetAxis("Vertical")) > 0.1f || Mathf.Abs(Input.GetAxis("Mouse X")) > 0.1f;
            animator.SetBool("isWalkingWild", isMoving);
            animator.SetBool("isIdle", !isMoving);
            // Si el Raptor no se está moviendo, activa el estado Idle
            // Si el Raptor no se está moviendo, activa el estado Idle
            if (!isMoving)
            {
                animator.SetBool("isIdle", true);
            }
            else
            {
                animator.SetBool("isIdle", false);
            }
        }

     
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

                Raptor vidaObjetivoRaptor = enemyTarget.GetComponent<Raptor>();
                if (vidaObjetivoRaptor != null)
                {
                    vidaObjetivoRaptor.TakeDamage(daño);
                    continue;
                }
            }
        }
    }
    private void HandleMountedMovement()
    {
        float moveInput = Input.GetAxis("Vertical");
        float turnInput = Input.GetAxis("Mouse X");

        // Calcula la nueva posición y rotación
        Vector3 newPosition = raptorRigidbody.position + transform.forward * moveSpeed * moveInput * Time.deltaTime;
        Quaternion newRotation = raptorRigidbody.rotation * Quaternion.Euler(0, turnInput * turnSpeed * Time.deltaTime, 0);

        // Aplica la nueva posición y rotación
        raptorRigidbody.MovePosition(newPosition);
        raptorRigidbody.MoveRotation(newRotation);
    }

    private void HandleMountedAttack()
    {
        if (Input.GetMouseButtonDown(0)) // Reemplaza con la tecla deseada
        {
            StartCoroutine(MountedAttack());
        }
    }
    private IEnumerator MountedAttack()
    {
        animator.SetBool("isWalkingWild", false);
        animator.SetBool("isIdle", false);
        // Activar el collider de ataque y la animación
        attackCollider.enabled = true;
        animator.SetBool("isAttackingWild", true);
      
      

        yield return new WaitForSeconds(0.5f); // Duración del ataque
        CausarDañoAlObjetivo();
        yield return new WaitForSeconds(0.5f);


        // Desactivar el collider de ataque y la animación
        attackCollider.enabled = false;
        animator.SetBool("isAttackingWild", false); // Desactiva la animación de ataque
        

    }

    public override void Feed(Item item)
    {
        if (domesticationLevel >= domesticationThreshold)
        {
            isDomesticated = true;
            Debug.Log("Raptor domesticado.");
        }
        if (CalculatedHealth() <= healthThresholdToRun)
        {
            if (item.itemType == Item.ItemType.ConsumableTameoRaptor)
            {
                domesticationLevel += domesticationIncreasePerFeed;
               
                Debug.Log("Raptor alimentado con carne. Nivel de domesticación aumentado.");
            }
            else
            {
                Debug.Log("El Raptor solo puede ser domesticado con carne.");
            }
        }
        else
        {
            Debug.Log("El Raptor debe tener poca salud para ser alimentado.");
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
    private void RunAway()
    {
        if (playerTransform != null && agent != null)
        {
            isRunningAway = true;

            Vector3 directionAwayFromPlayer = (transform.position - playerTransform.position).normalized;
            Vector3 runAwayTarget = transform.position + directionAwayFromPlayer * followDistance;
            agent.SetDestination(runAwayTarget);

            if (Vector3.Distance(transform.position, playerTransform.position) > followDistance)
            {
                isRunningAway = false;
                // Restablecer comportamiento normal
            }
        }
    }

    private bool IsDomesticated()
    {
        isDomesticated = true;
        return domesticationLevel >= domesticationThreshold;
    }
    public void RideRaptor(GameObject playerObject)
    {
        player = playerObject;
        isBeingRidden = true;

        // Configura al jugador para ser hijo del punto de montaje
        player.transform.SetParent(mountPoint, false);
        player.transform.localPosition = Vector3.zero;
        player.transform.localRotation = Quaternion.identity;

        Rigidbody raptorRigidbody = GetComponent<Rigidbody>();
       
        if (isDomesticated)
        {
            isBeingRidden = true;
            NavMeshAgent agent = GetComponent<NavMeshAgent>();
            if (agent != null)
            {
                agent.enabled = false;
            }

            // Desactivar la IA y otros comportamientos automáticos aquí
            Debug.Log("Raptor siendo montado.");
        }
    }
    public void DismountRaptor()
    {
        isBeingRidden = false;
        

        NavMeshAgent agent = GetComponent<NavMeshAgent>();
        if (agent != null)
        {
            agent.enabled = true;
        }

        if (player != null)
        {
            // Reactivar los componentes del jugador
            PlayerMotor playerMotor = player.GetComponent<PlayerMotor>();
            playerMotor.SwitchToMainCamera();
            if (playerMotor != null)
            {
                playerMotor.enabled = true; // Reactiva el control del jugador

                var characterController = player.GetComponent<CharacterController>();
                if (characterController != null)
                {
                    characterController.enabled = true;
                }

                var collider = player.GetComponent<Collider>();
                if (collider != null)
                {
                    collider.enabled = true;
                }

                var rigidbody = player.GetComponent<Rigidbody>();
              
                playerMotor.weaponController.enabled = true;
                playerMotor. footstep.enabled = true;

                // Restablecer la posición y rotación del jugador si es necesario
                player.transform.SetParent(null);
            }

            player = null; // Limpiar la referencia al jugador
        }
        // Aquí puedes reactivar otros comportamientos o componentes del Raptor si es necesario
    }

    private void FollowPlayer()
    {
        if (!isBeingRidden)
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
    public void TakeDamage(float damage)
    {
        vida -= damage;
        vida = Mathf.Clamp(vida, 0, vidaMaxima);
       
    }
   
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("AtaqueTameado"))
        {
            TakeDamage(daño);
        }
    }
}
