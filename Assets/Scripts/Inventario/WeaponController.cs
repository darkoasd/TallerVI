using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WeaponController : MonoBehaviour
{
    public GameObject shotgun;
    public GameObject pistol;
    public GameObject rifle;

    private GameObject currentWeapon;

    private void Start()
    {
        // Inicialmente, ninguna arma está equipada.
        DeactivateAllWeapons();
    }

    public void EquipWeapon(Item weapon)
    {
        Debug.Log("Equipando arma: " + weapon.itemName);
        DeactivateAllWeapons();

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
    }

    private void DeactivateAllWeapons()
    {
        shotgun.SetActive(false);
        pistol.SetActive(false);
        rifle.SetActive(false);
        currentWeapon = null;
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
