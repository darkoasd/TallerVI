using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class WeaponController : MonoBehaviour
{
    public GameObject shotgun;
    public GameObject pistol;
    public GameObject rifle;

    private GameObject currentWeapon;

    //UI
    public TextMeshProUGUI textMunicion;
    private void Start()
    {
        // Inicialmente, ninguna arma está equipada.
        DeactivateAllWeapons();
    }
    private void Update()
    {
      
    }
    public void EquipWeapon(Item weapon)
    {
        Debug.Log("Equipando arma: " + weapon.itemName);
        DeactivateAllWeapons();

        GameObject weaponPrefab = null;

        switch (weapon.itemName)
        {
            case "Escopeta":
                shotgun.SetActive(true);
                currentWeapon = shotgun;
                break;
            case "Pistola":
                pistol.SetActive(true);
                currentWeapon = pistol;
                break;
            case "Rifle":
                rifle.SetActive(true);
                currentWeapon = rifle;
                break;
            default:
                Debug.LogWarning("Arma no reconocida.");
                break;
        }
        if (currentWeapon != null)
        {
            Arma armaScript = currentWeapon.GetComponent<Arma>();
            if (armaScript != null)
            {
                // ... otras configuraciones ...

                // Suscribirse al evento de cambio de munición
                armaScript.onAmmoChanged += UpdateAmmoUI;
                UpdateAmmoUI(armaScript.municion, armaScript.municionReserva); // Actualizar UI inmediatamente al equipar
            }
        }

        if (weaponPrefab != null)
        {
            currentWeapon = Instantiate(weaponPrefab, transform.position, transform.rotation, transform);
            Arma armaScript = currentWeapon.GetComponent<Arma>();
            if (armaScript != null)
            {
                // Sincroniza los datos del arma con el objeto Item
                armaScript.municion = weapon.municion;
                // ... Otros datos ...

                // Configura la referencia al arma en el objeto Item
                weapon.armaAsociada = armaScript;
            }
            // ... Configura la arma aquí si es necesario ...
        }
    }
    private void UpdateAmmoUI(int currentAmmo, int maxAmmo)
    {
        textMunicion.text = currentAmmo + " / " + maxAmmo;
    }

    private void DeactivateAllWeapons()
    {
        shotgun.SetActive(false);
        pistol.SetActive(false);
        rifle.SetActive(false);
        currentWeapon = null;
        // Desuscribirse del evento para evitar referencias nulas
        if (currentWeapon != null)
        {
            Arma armaScript = currentWeapon.GetComponent<Arma>();
            if (armaScript != null)
            {
                armaScript.onAmmoChanged -= UpdateAmmoUI;
            }
        }
    }

    // Aquí puedes agregar más funciones, como disparar, recargar, etc.
    // Por ejemplo, si quieres disparar, puedes hacer algo como:
    public void Shoot()
    {
        if (currentWeapon != null)
        {
            // Lógica de disparo aquí
        }
    }
}
