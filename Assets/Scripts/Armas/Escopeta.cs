using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Escopeta : Arma
{
    public Camera fpsCam;
    public int numDeBalas = 5; // Número de rayos (balas) que dispara en un solo disparo
    public float dispersión = 0.1f; // Cómo de disperso es el patrón de disparo
    public float range = 100f;
    public int pelletsPerShot = 8;
    public float spreadAngle = 10f;


    private void Start()
    {
        
        tipoBala = TipoBala.Escopeta;
    }
    protected override void Disparar()
    {
        base.Disparar();
       
        if (municion <= 0)
        {
            Debug.Log("Sin munición");
            return;
        }

      
        Debug.Log("Disparando con la escopeta. SlotIndex: " + SlotIndex);
     
        // Implementación específica de disparar para la escopeta
        Vector3 puntoCentralPantalla = new Vector3(Screen.width / 2, Screen.height / 2, 0);

        int layerMask = 1 << LayerMask.NameToLayer("Interactable");
        layerMask = ~layerMask;
       
        for (int i = 0; i < numDeBalas; i++)
        {

            Quaternion pelletRotation = Quaternion.LookRotation(fpsCam.transform.forward);
            Quaternion randomRotation = Random.rotation;
            pelletRotation = Quaternion.RotateTowards(pelletRotation, randomRotation, Random.Range(0f, spreadAngle));

            // Raycast to check for hits
            RaycastHit hit;
            Vector3 direction = pelletRotation * Vector3.forward;

            if (Physics.Raycast(shootPoint.position, direction, out hit, range))
            {
                Debug.Log("Objeto golpeado: " + hit.transform.name);
                if (hit.collider.isTrigger)
                {
                    continue; // Salta a la próxima iteración del bucle
                }
                GameObject bulletHole = Instantiate(bulletHolePrefab, hit.point, Quaternion.LookRotation(hit.normal));
                Destroy(bulletHole, 5f);

                GameObject muzzleEffect = Instantiate(muzzleEffectPrefab, shootPoint.position, Quaternion.identity);
                Destroy(muzzleEffect, 2f);
            }
            else
            {
                Debug.Log("No se golpeó ningún objeto");
            }
            if (hit.transform.CompareTag("Compy"))
            {
                Dinosaurio dinosaurio = hit.transform.GetComponent<Dinosaurio>();
                if (dinosaurio != null)
                {
                    dinosaurio.RecibirDaño(daño);
                }
            }

        }
    }

    protected override void Recargar()
    {
        // Si necesitas una lógica de recarga diferente para la escopeta, puedes sobrescribir el método aquí
        base.Recargar();
    }

    protected override void Update()
    {
        base.Update(); // Llama a la lógica de Update de la clase padre
        // Cualquier lógica adicional de Update para la escopeta
    }

}
