using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TrapRaptor : MonoBehaviour
{
    
    private void OnTriggerEnter(Collider other)
    {
        Debug.Log("Algo entró en la trampa"); // Esto te dirá si algo entra en el trigger.
        Raptor raptor = other.GetComponent<Raptor>();
        if (raptor != null)
        {
            raptor.GetTrapped();
        }
    }
}
