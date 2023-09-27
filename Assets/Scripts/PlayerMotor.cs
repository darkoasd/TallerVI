using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;

public class PlayerMotor : MonoBehaviour
{
    // Referencia al Compy cercano
    public List<Compy> nearbyCompy = new List<Compy>();

    // Referencia al inventario del jugador
    public Inventory inventory;
    private GameManager gamemanager;
    //Movimiento
    public float speed = 5.0f;
    public float mouseSensitivity = 2.0f;

    private CharacterController characterController;
    private Camera playerCamera;

    private float pitch = 0.0f;
    public float maxPitch = 80.0f;
    public float minPitch = -80.0f;

    //Salto
    public float jumpForce = 5.0f; // Fuerza del salto
    private bool isJumping = false; // Para verificar si el jugador ya est� saltando
    public float jumpEnergyCostPercentage = 10.0f; // Porcentaje de energ�a que se resta al saltar

    //Salud

    public int maxHealth = 10;
    public int currentHealth;
    private int previousHealth;
    public HealthBar healthBar; // Referencia a tu script de HealthBar

    //Energia

    public float runSpeed = 10.0f; // Velocidad al correr
    private float walkSpeed; // Velocidad normal al caminar

    public int maxEnergy = 10; // Energ�a m�xima
    public float currentEnergy; // Energ�a actual
    private float energyFloat;
    private float previousEnergy;

    public float energyDrainRate = 10.0f; // Cu�nta energ�a se consume por segundo al correr
    public float energyRegenRate = 2.0f; // Cu�nta energ�a se regenera por segundo al no correr
    public EnergyBar energyBar;

    //gravity
    private float verticalSpeed = 0.0f;
    private float gravity = -9.81f;

    //item

    public TextMeshProUGUI itemPickupText; // Referencia al UI Text
    public bool canPickUpItem = false; // Para saber si el jugador puede recoger el �tem
    private Item nearbyItem; // Referencia al �tem cercano
   

    void Start()
    {
        currentHealth = maxHealth;
        healthBar.SetMaxHealth(maxHealth);
        previousHealth = currentHealth;

        characterController = GetComponent<CharacterController>();
        playerCamera = Camera.main;
        Cursor.lockState = CursorLockMode.Locked; // Esconde y bloquea el cursor al centro de la pantalla


        walkSpeed = speed; // Guarda la velocidad de caminar original
        currentEnergy = maxEnergy;
        previousEnergy = currentEnergy;
        energyBar.SetMaxHealth(maxEnergy); // Inicializa la barra de energ�a
        energyFloat = currentEnergy;

    }
    public void TakeDamage(int damage)
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
        if (!Input.GetButton("Fire3")) // Si no est�s corriendo
        {
            currentEnergy += energyRegenRate * Time.deltaTime;
        }
        currentEnergy = Mathf.Clamp(currentEnergy, 0, maxEnergy);
    }
    private void HandleJump()
    {
        // Si presiona la tecla de espacio, no est� saltando y tiene suficiente energ�a
        if (Input.GetKeyDown(KeyCode.Space) && characterController.isGrounded)
        {
            if (currentEnergy >= 5)
            {
                verticalSpeed = Mathf.Sqrt(jumpForce * -2f * gravity);
                currentEnergy -= 5.0f; // Reducimos 5 unidades de energ�a
            }
        }
    }
    
    void Update()
    {
        
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

            // Rotaci�n del jugador y la c�mara
            float mouseX = Input.GetAxis("Mouse X");
            float mouseY = Input.GetAxis("Mouse Y");

            transform.Rotate(Vector3.up * mouseX * mouseSensitivity); // Rotaci�n horizontal

            pitch -= mouseY * mouseSensitivity;
            pitch = Mathf.Clamp(pitch, minPitch, maxPitch);
            playerCamera.transform.localEulerAngles = new Vector3(pitch, 0, 0); // Rotaci�n vertical
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
      
        // Puedes agregar m�s condiciones aqu� si hay plataformas espec�ficas o �reas donde no quieres que se detecte la colisi�n
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


}