using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TriggerHandle : MonoBehaviour
{
    private Compy compy;
    private Raptor raptor;

    private void Start()
    {
        // Si compy no se ha asignado en el inspector, intenta encontrarlo en el objeto padre
        if (compy == null)
        {
            compy = GetComponentInParent<Compy>();
        }
        if (raptor == null)
        {
            raptor = GetComponentInParent<Raptor>();
        }

    }

    private void OnTriggerEnter(Collider other)
    {
        if (compy != null)
        {
            compy.HandleTriggerEnter(other);
        }
        if (raptor != null)
        {
            raptor.HandleTriggerEnter(other);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (compy != null)
        {
            compy.HandleTriggerExit(other);
        }
        if (raptor != null)
        {
            raptor.HandleTriggerExit(other);
        }
    }
}
