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

    public WeaponController weaponController;
    public footStep footstep;


    [SerializeField] private Camera mainCamera;
    [SerializeField] private Camera raptorCamera; // Cámara del Raptor
    public float verticalSpeedCamera = 1.0f;
    public float horizontalSpeedCamera = 1.0f;
    //Monturas
    private Raptor raptorCercano;
    void Start()
    {
        weaponController = GetComponent<WeaponController>();
        footstep = GetComponent<footStep>();
        originalJumpForce = jumpForce;
        audioSource = gameObject.AddComponent<AudioSource>();

        audioSource.playOnAwake = false; // No queremos que el sonido se reproduzca automáticamente al inicio
        currentHealth = maxHealth;
        healthBar.SetMaxHealth(maxHealth);
        previousHealth = currentHealth;

        characterController = GetComponent<CharacterController>();

        Cursor.lockState = CursorLockMode.Locked; // Esconde y bloquea el cursor al centro de la pantalla


        walkSpeed = speed; // Guarda la velocidad de caminar original
        currentEnergy = maxEnergy;
        previousEnergy = currentEnergy;
        energyBar.SetMaxHealth(maxEnergy); // Inicializa la barra de energía
        energyFloat = currentEnergy;

    }
    public void TakeDamage(float damage)
    {
        Debug.Log("TakeDamage llamado. Daño recibido: " + damage + ", Salud actual antes del daño: " + currentHealth);
        currentHealth -= damage;
        currentHealth = Mathf.Clamp(currentHealth, 0, maxHealth);
        healthBar.SetHealth(currentHealth);
        Debug.Log("Salud después de recibir daño: " + currentHealth);
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
                verticalSpeed = Mathf.Sqrt(jumpForce * -1.5f * gravity);
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
    public void CompyDestroyed(Compy compy)
    {
        if (nearbyCompy.Contains(compy))
        {
            nearbyCompy.Remove(compy);
        }
    }

    void Update()
    {

        if (Input.GetKeyDown(KeyCode.E) && nearbyRaptor.Count > 0)
        {
            Raptor nearestRaptor = nearbyRaptor[0];
            if (nearestRaptor.isDomesticated)
            {
                MountRaptor(nearestRaptor);
            }
        }
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

            float mouseX = Input.GetAxis("Mouse X");
            float mouseY = Input.GetAxis("Mouse Y");
            transform.Rotate(Vector3.up * mouseX * mouseSensitivity); // Rotación horizontal
            pitch -= mouseY * mouseSensitivity;
            pitch = Mathf.Clamp(pitch, minPitch, maxPitch);
            mainCamera.transform.localEulerAngles = new Vector3(pitch, 0, 0);




            if (!characterController.isGrounded)
            {
                // Aplica una gravedad más fuerte si el jugador está cayendo
                if (verticalSpeed < 0)
                {
                    verticalSpeed += gravity * 2.0f * Time.deltaTime; // Aumenta la gravedad durante la caída
                }
                else
                {
                    verticalSpeed += gravity * Time.deltaTime; // Gravedad normal durante el ascenso
                }
            }
            else if (isJumping)
            {
                isJumping = false; // El jugador ha aterrizado
            }

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
        Debug.Log("OnCollisionEnter: El jugador ha comenzado a colisionar con " + collision.gameObject.name);

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
        if (other.gameObject.CompareTag("Raptor"))
        { // Asegúrate de que el raptor tenga la etiqueta "Raptor"
            raptorCercano = other.gameObject.GetComponent<Raptor>();
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
        if (other.gameObject.CompareTag("Raptor"))
        {
            raptorCercano = null;
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
    private void SwitchToRaptorCamera()
    {
        mainCamera.gameObject.SetActive(false);
        raptorCamera.gameObject.SetActive(true);
    }

    public void SwitchToMainCamera()
    {
        mainCamera.gameObject.SetActive(true);
        raptorCamera.gameObject.SetActive(false);
    }
    void MountRaptor(Raptor raptor)
    {

        if (raptor.isDomesticated)
        {
            raptor.RideRaptor(this.gameObject);
            this.enabled = false; // Desactiva el control del jugador
            SwitchToRaptorCamera();
            var characterController = GetComponent<CharacterController>();
            if (characterController != null)
            {
                characterController.enabled = false;
            }
            var collider = GetComponent<Collider>();
            if (collider != null)
            {
                collider.enabled = false;
            }
            var rigidbody = GetComponent<Rigidbody>();
            if (rigidbody != null)
            {
                rigidbody.isKinematic = true;
            }
            if (weaponController != null) weaponController.enabled = false;
            if (footstep != null) footstep.enabled = false;



            transform.SetParent(raptor.mountPoint, false);
            transform.localPosition = Vector3.zero;
            transform.localRotation = Quaternion.identity;


        }
    }
    public void DismountRaptor()
    {
        this.enabled = true; // Reactiva el control del jugador
        SwitchToMainCamera();
        var characterController = GetComponent<CharacterController>();
        if (characterController != null)
        {
            characterController.enabled = true;
        }

        var collider = GetComponent<Collider>();
        if (collider != null)
        {
            collider.enabled = true;
        }

        var rigidbody = GetComponent<Rigidbody>();
        if (rigidbody != null)
        {
            rigidbody.isKinematic = false;
        }
        if (weaponController != null) weaponController.enabled = true;
        if (footstep != null) footstep.enabled = true;

        transform.SetParent(null); // Remueve el parentesco con el Raptor
        // Ajusta la posición y rotación del jugador si es necesario

        // Cambiar la cámara de Cinemachine si es necesario
        // ...
    }

}