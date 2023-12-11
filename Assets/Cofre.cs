using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cofre : MonoBehaviour
{
    public GameObject itemRecompensa;
    public Transform itemSpawn;
    private bool cofreAbierto;
    public GameManager gamemanager;
    public int puntosDar;
    private Animator anim;

    private void Start()
    {
        anim = GetComponent<Animator>();
    }

    private void OnTriggerEnter(Collider other)
    {
        print("Colisionaron");
        if (other.CompareTag("Player") && cofreAbierto == false)
        {
            gamemanager.AddPoints(puntosDar);
            Instantiate(itemRecompensa,itemSpawn);
            cofreAbierto = true;
            anim.SetBool("AbrirCofre", true);
        }
    }
}
