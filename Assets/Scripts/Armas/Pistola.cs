using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Pistola : Arma
{
   

    protected override void Update()
    {
        base.Update(); // Llama a la l�gica de Update de la clase padre

       
    }

    protected override void Recargar()
    {
        // Si necesitas una l�gica de recarga diferente para la pistola, puedes sobrescribir el m�todo aqu�
        base.Recargar();
    }

    // Si quieres modificar el comportamiento del disparo espec�fico de la pistola, puedes hacerlo as�:
    protected override void Disparar()
    {
        // Comprueba si hay munici�n disponible
        if (municion <= 0)
        {
            Debug.Log("Sin munici�n");
            return;
        }

        // Disminuye la munici�n
        municion--;
        Debug.Log("Disparando con la pistola, munici�n restante: " + municion);
        if (SlotIndex >= 0 && SlotIndex < Inventory.instance.items.Count)
        {
            Debug.Log("Llamando a UpdateItemUI con SlotIndex: " + SlotIndex);
            Inventory.instance.UpdateItemUI(SlotIndex);
        }
        else if (SlotIndex >= Inventory.instance.items.Count && SlotIndex < Inventory.instance.items.Count + Inventory.instance.toolbarItems.Count)
        {
            Debug.Log("Llamando a UpdateToolbarItemUI con SlotIndex: " + SlotIndex);
            Inventory.instance.UpdateToolbarItemUI(SlotIndex - Inventory.instance.items.Count);
        }

        // Toma el centro de la pantalla
        Vector3 puntoCentralPantalla = new Vector3(Screen.width / 2, Screen.height / 2, 0);

        // Crea un rayo que se origina en el centro de la pantalla y va hacia adelante
        Ray rayo = Camera.main.ScreenPointToRay(puntoCentralPantalla);

        int layerMask = 1 << LayerMask.NameToLayer("Interactable");
        layerMask = ~layerMask;

        // Raycast para verificar colisiones
        RaycastHit hit;
        if (Physics.Raycast(rayo, out hit, Mathf.Infinity, layerMask))
        {
            if (hit.collider.isTrigger)
            {
                return; // Si el raycast golpea un collider que es trigger, no hacemos nada
            }

            // Instanciamos el "Bullet Hole" en el punto de impacto
            GameObject bulletHole = Instantiate(bulletHolePrefab, hit.point, Quaternion.LookRotation(hit.normal));
            Destroy(bulletHole, 5f);

            // Instanciamos el efecto de disparo
            GameObject muzzleEffect = Instantiate(muzzleEffectPrefab, shootPoint.position, Quaternion.identity);
            Destroy(muzzleEffect, 2f);

            // Si golpea un "Compy", inflige da�o
            if (hit.transform.CompareTag("Compy"))
            {
                Dinosaurio dinosaurio = hit.transform.GetComponent<Dinosaurio>();
                if (dinosaurio != null)
                {
                    dinosaurio.RecibirDa�o(da�o);
                }
            }
        }
    }

}

