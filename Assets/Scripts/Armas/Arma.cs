using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
public enum TipoBala
{
    Escopeta,
    Pistola,
    Rifle,
    // ... otros tipos de bala ...
}
public class Arma : MonoBehaviour
{
    public TipoBala tipoBala; // A�adido para identificar el tipo de bala que usa esta arma
    //Stats
    public int da�o;
    public int municion;
    public int municionMaxima;
    public int municionReserva; // La cantidad de munici�n disponible para recargar
    public int municionReservaMaxima; // La cantidad m�xima de munici�n que puede llevar en reserva
    public GameObject bulletHolePrefab, muzzleEffectPrefab;
    public Transform shootPoint;
    public PlayerMotor player;
    public float fireRate = 1f; // Tiempo entre disparos
    public float nextTimeToFire = 0f; // Tiempo en el que se podr� disparar nuevamente

    //Sounds
    public AudioClip sonidoDisparo; // El sonido de tu disparo
    public AudioClip sonidoRecarga; // El sonido de tu disparo
    private AudioSource audioSource; // El componente que reproducir� el sonido
    public int SlotIndex { get; set; } = -1;
    public Inventory inventory; // referencia al inventario

    public delegate void OnAmmoChanged(int currentAmmo, int maxAmmo);
    public event OnAmmoChanged onAmmoChanged;

    protected virtual void Start()
    {

        municion = municionMaxima;

        // Inicializar el AudioSource
        audioSource = gameObject.AddComponent<AudioSource>();
        audioSource.clip = sonidoDisparo;
        audioSource.playOnAwake = false; // No queremos que el sonido se reproduzca autom�ticamente al inicio

    }

    
    public virtual void Disparar()
    {
        if (municion <= 0)
        {
            Debug.Log("Sin munici�n");
            return; // No hay munici�n, por lo tanto, no se ejecuta el disparo
        }

        municion--;
        onAmmoChanged?.Invoke(municion, municionReserva);

        // Reproduce el sonido de disparo
        if (audioSource != null && sonidoDisparo != null)
        {
            audioSource.PlayOneShot(sonidoDisparo);
        }
    }


    protected virtual void Recargar()
    {
        int municionNecesaria = municionMaxima - municion;
        int municionARecargar = Mathf.Min(municionNecesaria, municionReserva);

        municion += municionARecargar;
        municionReserva -= municionARecargar;

        onAmmoChanged?.Invoke(municion, municionReserva);

        // Reproduce el sonido de recarga
        if (audioSource != null && sonidoRecarga != null)
        {
            audioSource.PlayOneShot(sonidoRecarga);
        }
    }

    protected virtual void Update()
    {
      
        
        if (Input.GetKeyDown(KeyCode.R))
        {
           
            Debug.Log("Tecla R presionada");
            Recargar();
        }

       
    }
    
   
  



}

