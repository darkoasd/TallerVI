using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TriggerHandle : MonoBehaviour
{
    public Compy compy;

    private void Start()
    {
        // Si compy no se ha asignado en el inspector, intenta encontrarlo en el objeto padre
        if (compy == null)
        {
            compy = GetComponentInParent<Compy>();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (compy != null)
        {
            compy.HandleTriggerEnter(other);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (compy != null)
        {
            compy.HandleTriggerExit(other);
        }
    }
}
