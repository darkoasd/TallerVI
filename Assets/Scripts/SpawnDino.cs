using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnDino : MonoBehaviour
{
   
    public GameObject prefabToSpawn; // Prefab a spawnear
    public Transform spawnLocation; // Ubicaci�n espec�fica para spawnear el prefab
    private bool hasSpawned = false; // Controla si el prefab ya ha sido spawnado

    void OnTriggerEnter(Collider other)
    {
        // Verifica si el objeto con el que entr� en contacto tiene el tag 'Player' y si el prefab a�n no ha sido spawnado
        if (other.CompareTag("Player") && !hasSpawned)
        {
            // Spawnear el prefab en la ubicaci�n especificada por spawnLocation
            Instantiate(prefabToSpawn, spawnLocation.position, spawnLocation.rotation);

            // Marcar que el prefab ha sido spawnado para prevenir spawns adicionales
            hasSpawned = true;
        }
    }
}
