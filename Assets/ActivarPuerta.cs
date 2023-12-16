using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
public class ActivarPuerta : MonoBehaviour
{
    public TextMeshProUGUI textoPuerta;

    public void UnlockDoor()
    {
        // Desactiva el collider de la puerta
        GetComponent<Collider>().enabled = false;

        // Cambia el texto del TextMeshPro a una cadena vacía
        if (textoPuerta != null)
        {
            textoPuerta.text = "";
        }
        else
        {
            Debug.LogWarning("Referencia a TextMeshProUGUI no establecida en ActivarPuerta.");
        }
    }
}
