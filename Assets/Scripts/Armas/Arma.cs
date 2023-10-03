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
    public int SlotIndex { get; set; } = -1;
    public Inventory inventory; // referencia al inventario

    public delegate void OnAmmoChanged(int currentAmmo, int maxAmmo);
    public event OnAmmoChanged onAmmoChanged;

    private void Start()
    {
        municion = municionMaxima;
    }

    protected virtual void Disparar()
    {

        municion--;
        onAmmoChanged?.Invoke(municion, municionReserva);

    }
  

    protected virtual void Recargar()
    {
        int municionNecesaria = municionMaxima - municion;
        int municionARecargar = Mathf.Min(municionNecesaria, municionReserva);

        municion += municionARecargar;
        municionReserva -= municionARecargar;

        onAmmoChanged?.Invoke(municion, municionReserva);
    }

    protected virtual void Update()
    {
        Debug.Log("Update de Arma ejecut�ndose");
        if (Input.GetKeyDown(KeyCode.R))
        {
           
            Debug.Log("Tecla R presionada");
            Recargar();
        }

        if (Input.GetMouseButtonDown(0) && municion > 0 && Time.time >= nextTimeToFire)
        {
            Debug.Log("Bot�n del mouse presionado para disparar");
            nextTimeToFire = Time.time + 1f / fireRate; // Configura el siguiente momento para disparar
            Disparar();
        }
    }
    
   
  



}

