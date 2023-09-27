using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Arma : MonoBehaviour
{
    public int daño;
    public int municion;
    public int municionMaxima;
    public int municionReserva; // La cantidad de munición disponible para recargar
    public int municionReservaMaxima; // La cantidad máxima de munición que puede llevar en reserva
    public GameObject bulletHolePrefab, muzzleEffectPrefab;
    public Transform shootPoint;
    public PlayerMotor player;
    public float fireRate = 1f; // Tiempo entre disparos
    public float nextTimeToFire = 0f; // Tiempo en el que se podrá disparar nuevamente
    public int SlotIndex { get; set; } = -1;
    public Inventory inventory; // referencia al inventario
    

    protected virtual void Disparar()
    {
        if (municion > 0)
        {
            municion--;

            // Actualiza la UI de la munición en el inventario
            if (SlotIndex >= 0 && SlotIndex < inventory.items.Count)
            {
                inventory.items[SlotIndex].armaAsociada.municion = municion;
                inventory.UpdateItemUI(SlotIndex);
            }
        }

    }

    protected virtual void Recargar()
    {
        int municionNecesaria = municionMaxima - municion;
        int municionARecargar = Mathf.Min(municionNecesaria, municionReserva);

        municion += municionARecargar;
        municionReserva -= municionARecargar;

        // Actualiza la UI de la munición en el inventario
        if (SlotIndex >= 0 && SlotIndex < inventory.items.Count)
        {
            inventory.items[SlotIndex].armaAsociada.municion = municion;
            inventory.UpdateItemUI(SlotIndex);
        }
    }

    protected virtual void Update()
    {
        if (Input.GetKeyDown(KeyCode.R))
        {
            Recargar();
        }

        if (Input.GetMouseButtonDown(0) && municion > 0 && Time.time >= nextTimeToFire)
        {
            nextTimeToFire = Time.time + 1f / fireRate; // Configura el siguiente momento para disparar
            Disparar();
        }
    }
    public void Awake()
    {
        inventory = Inventory.instance;
    }


}

