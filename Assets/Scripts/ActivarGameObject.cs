using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivarGameObject : MonoBehaviour
{
    public GameObject goActivar;
    private bool activado = false;
    private void Start()
    {
        goActivar.SetActive(false);
    }

    private void OnTriggerEnter(Collider other)
    {
        goActivar.SetActive(true);
        activado = true;
    }
}
