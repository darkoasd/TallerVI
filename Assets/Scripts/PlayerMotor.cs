using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;

public class PlayerMotor : MonoBehaviour
{
    public float curarse;
    // Referencia al Compy cercano
    public List<Compy> nearbyCompy = new List<Compy>();
    public List<Raptor> nearbyRaptor = new List<Raptor>();
    public Transform playerNeckTransform;
    // Referencia al inventario del jugador
    public Inventory inventory;
    public GameManager gamemanager;
    //Movimiento
    public float speed = 5.0f;
    public float mouseSensitivity = 2.0f;

    private CharacterController characterController;
    private Camera playerCamera;

    private float pitch = 0.0f;
    public float maxPitch = 80.0f;
    public float minPitch = -80.0f;

    //Salto
    private float originalJumpForce;
    public float jumpForce = 5.0f; // Fuerza del salto
    public bool isJumping = false; // Para verificar si el jugador ya está saltando
    public float jumpEnergyCostPercentage = 10.0f; // Porcentaje de energía que se resta al saltar

    //Salud

    public float maxHealth = 10;
    public float currentHealth;
    private float previousHealth;
    public HealthBar healthBar; // Referencia a tu script de HealthBar

    //Energia

    public float runSpeed = 10.0f; // Velocidad al correr
    private float walkSpeed; // Velocidad normal al caminar

    public int maxEnergy = 10; // Energía máxima
    public float currentEnergy; // Energía actual
    private float energyFloat;
    private float previousEnergy;

    public float energyDrainRate = 10.0f; // Cuánta energía se consume por segundo al correr
    public float energyRegenRate = 2.0f; // Cuánta energía se regenera por segundo al no correr
    public EnergyBar energyBar;

    //gravity
    private float verticalSpeed = 0.0f;
    private float gravity = -9.81f;
    //Sounds
    public AudioClip sonidoSalto; // El sonido de tu salto
    private AudioSource audioSource; // El componente que reproducirá el sonido
    //item

    public TextMeshProUGUI itemPickupText; // Referencia al UI Text
    public bool canPickUpItem = false; // Para saber si el jugador puede recoger el ítem
    private Item nearbyItem; // Referencia al ítem cercano
   

    void Start()
    {
        originalJumpForce = jumpForce;
        audioSource = gameObject.AddComponent<AudioSource>();

        audioSource.playOnAwake = false; // No queremos que el sonido se reproduzca automáticamente al inicio
        currentHealth = maxHealth;
        healthBar.SetMaxHealth(maxHealth);
        previousHealth = currentHealth;

        characterController = GetComponent<CharacterController>();
        playerCamera = Camera.main;
        Cursor.lockState = CursorLockMode.Locked; // Esconde y bloquea el cursor al centro de la pantalla


        walkSpeed = speed; // Guarda la velocidad de caminar original
        currentEnergy = maxEnergy;
        previousEnergy = currentEnergy;
        energyBar.SetMaxHealth(maxEnergy); // Inicializa la barra de energía
        energyFloat = currentEnergy;

    }
    public void TakeDamage(float damage)
    {
        currentHealth -= damage;
        currentHealth = Mathf.Clamp(currentHealth, 0, maxHealth);
        healthBar.SetHealth(currentHealth);
    }
    private void CheckHealthChange()
    {
        if (currentHealth != previousHealth)
        {
            healthBar.SetHealth(currentHealth);
            previousHealth = currentHealth;
        }
    }

    public void Heal(int amount)
    {
        currentHealth += amount;
        currentHealth = Mathf.Clamp(currentHealth, 0, maxHealth);
        healthBar.SetHealth(currentHealth);
    }
    private void CheckEnergyChange()
    {
        if ((int)currentEnergy != previousEnergy)
        {
            
            energyBar.SetHealth((int)currentEnergy);
            previousEnergy = (int)currentEnergy;
        }
        else
        {
            
        }
    }
    private void HandleRunning()
    {
        if (Input.GetButton("Fire3") && currentEnergy >= 1)
        {
            speed = runSpeed;
            currentEnergy -= energyDrainRate * Time.deltaTime;
        }
        else
        {
            speed = walkSpeed;
        }
    }
    private void HandleEnergyRegen()
    {
        if (!Input.GetButton("Fire3")) // Si no estás corriendo
        {
            currentEnergy += energyRegenRate * Time.deltaTime;
        }
        currentEnergy = Mathf.Clamp(currentEnergy, 0, maxEnergy);
    }
    private void HandleJump()
    {
        // Si presiona la tecla de espacio, no está saltando y tiene suficiente energía
        if (Input.GetKeyDown(KeyCode.Space) && characterController.isGrounded)
        {
            if (currentEnergy >= 5)
            {
                verticalSpeed = Mathf.Sqrt(jumpForce * -2f * gravity);
                currentEnergy -= 5.0f; // Reducimos 5 unidades de energía
                isJumping = true;
                // Reproduce el sonido de salto
                if (audioSource != null && sonidoSalto != null)
                {
                    audioSource.PlayOneShot(sonidoSalto);
                }
            }
        }
    }
    private void Fly()
    {
        // Eleva al jugador mientras el Compy tiene energía de vuelo
        if (nearbyCompy[0].flightEnergy > 0)
        {
            verticalSpeed = 5.0f; // Ajusta este valor según la velocidad con que quieras que el jugador se eleve
            nearbyCompy[0].UseFlightEnergy(Time.deltaTime * 5.0f); // Ajusta este valor según la rapidez con que quieras que se agote la energía de vuelo
        }
        else
        {
            // Si la energía de vuelo se agota, el jugador cae
            verticalSpeed = gravity * Time.deltaTime;
        }

        // Aplica el movimiento vertical
        Vector3 verticalMove = new Vector3(0, verticalSpeed, 0) * Time.deltaTime;
        characterController.Move(verticalMove);
    }
    private void RegenerateCompyFlightEnergy()
    {
        // Regenera la energía de vuelo del Compy mientras el jugador está en el suelo
        nearbyCompy[0].flightEnergy += 5.0f * Time.deltaTime; // Ajusta este valor según la rapidez con que quieras que se regenere la energía de vuelo
        nearbyCompy[0].flightEnergy = Mathf.Clamp(nearbyCompy[0].flightEnergy, 0, 10.0f); // Asegura que la energía de vuelo no exceda el máximo
    }

    void Update()
    {
        if (nearbyCompy.Count > 0 && nearbyCompy[0].transform.parent == playerNeckTransform && Input.GetKey(KeyCode.Space))
        {
            Fly();
        }
        // Si el jugador está en el suelo, regenerar la energía de vuelo del Compy
        else if (characterController.isGrounded && nearbyCompy.Count > 0)
        {
            RegenerateCompyFlightEnergy();
        }
        if (Input.GetKeyDown(KeyCode.E) && nearbyCompy.Count > 0)
        {
            Compy nearestCompy = nearbyCompy[0];
            if (nearestCompy.isPlayerNearby && nearestCompy.domesticationLevel >= nearestCompy.domesticationThreshold)
            {
                // Si el Compy ya está siendo llevado, suéltalo
                if (nearestCompy.transform.parent == playerNeckTransform)
                {
                    nearestCompy.BeDroppedOrFollow();
                }
                // Si el Compy no está siendo llevado, recógelo
                else
                {
                    nearestCompy.BePickedUp(playerNeckTransform);
                }
            }
        }
        if (currentHealth <= 0)
        {
            Debug.Log("Murio");
            Muerte();
        }
        if (Time.timeScale == 1f)
        {
            HandleRunning();
            HandleJump();
            HandleEnergyRegen();
            CheckEnergyChange();
            CheckHealthChange();

            // Movimiento del jugador
            float x = Input.GetAxis("Horizontal");
            float z = Input.GetAxis("Vertical");
            Vector3 moveDirection = transform.right * x + transform.forward * z;
            characterController.Move(moveDirection * speed * Time.deltaTime);

            // Rotación del jugador y la cámara
            float mouseX = Input.GetAxis("Mouse X");
            float mouseY = Input.GetAxis("Mouse Y");

            transform.Rotate(Vector3.up * mouseX * mouseSensitivity); // Rotación horizontal

            pitch -= mouseY * mouseSensitivity;
            pitch = Mathf.Clamp(pitch, minPitch, maxPitch);
            playerCamera.transform.localEulerAngles = new Vector3(pitch, 0, 0); // Rotación vertical
                                                                                // Actualizar la velocidad vertical basado en la gravedad
            verticalSpeed += gravity * Time.deltaTime;

            // Mover el personaje verticalmente basado en la velocidad vertical
            Vector3 verticalMove = new Vector3(0, verticalSpeed, 0) * Time.deltaTime;
            characterController.Move(verticalMove);

        }
        if (canPickUpItem && Input.GetKeyDown(KeyCode.E))
        {
            Inventory.instance.AddItem(nearbyItem);
            nearbyItem.gameObject.SetActive(false); // Desactivar el objeto Item en la escena en lugar de destruirlo
            itemPickupText.gameObject.SetActive(false); // Ocultar el mensaje
        }
    }
    void OnCollisionEnter(Collision collision)
    {
      
        // Puedes agregar más condiciones aquí si hay plataformas específicas o áreas donde no quieres que se detecte la colisión
        if (collision.gameObject.CompareTag("Ground"))
        {
            
            isJumping = false;
        }
    }
    private void OnTriggerEnter(Collider other)
    {
        Item item = other.gameObject.GetComponent<Item>();
        if (item != null)
        {
            canPickUpItem = true;
            nearbyItem = item;
            itemPickupText.gameObject.SetActive(true); // Mostrar el mensaje
        }
    }

    private void OnTriggerExit(Collider other)
    {
        Item item = other.gameObject.GetComponent<Item>();
        if (item != null)
        {
            canPickUpItem = false;
            nearbyItem = null;
            itemPickupText.gameObject.SetActive(false); // Ocultar el mensaje
        }
    }
    private void Muerte()
    {
        gamemanager.GameOver();
    }
    public void CurarPlayer()
    {
        currentHealth += curarse;
        currentHealth = Mathf.Min(currentHealth, maxHealth);
    }



}