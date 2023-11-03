using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RifleFrancotirador : Arma
{
    protected override void Start()
    {
        tipoBala = TipoBala.Rifle;
        base.Start();
    }
    protected override void Update()
    {
        base.Update(); // Llama a la lógica de Update de la clase padre


    }

    protected override void Recargar()
    {
        // Si necesitas una lógica de recarga diferente para la pistola, puedes sobrescribir el método aquí
        base.Recargar();
    }
    public override void Disparar()
    {
        base.Disparar();

        // Comprueba si hay munición disponible
        if (municion <= 0)
        {
            Debug.Log("Sin munición");
            return;
        }

        // Disminuye la munición

        // Después de modificar la munición




        Debug.Log("Disparando con la pistola, munición restante: " + municion);



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
            Debug.Log("Objeto golpeado: " + hit.transform.name);
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

            // Si golpea un "Compy", inflige daño
            if (hit.transform.CompareTag("Compy"))
            {
                Dinosaurio dinosaurio = hit.transform.GetComponent<Dinosaurio>();
                if (dinosaurio != null)
                {
                    dinosaurio.RecibirDaño(daño);
                }
            }
        }
        else
        {
            Debug.Log("No se golpeó ningún objeto");
        }
    }
}
