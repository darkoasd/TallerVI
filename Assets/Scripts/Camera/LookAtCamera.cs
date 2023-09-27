using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LookAtCamera : MonoBehaviour
{
    private Camera mainCamera;

    void Start()
    {
        // Encuentra la cámara principal en la escena
        mainCamera = Camera.main;
    }

    void Update()
    {
        // Hace que este objeto mire siempre hacia la cámara
        transform.LookAt(transform.position + mainCamera.transform.rotation * Vector3.forward,
            mainCamera.transform.rotation * Vector3.up);
    }
}
