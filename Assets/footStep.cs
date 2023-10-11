using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class footStep : MonoBehaviour
{
    public GameObject footstep;
    public PlayerMotor player;

    // Start is called before the first frame update
    void Start()
    {
        footstep.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if(player.isJumping == false)
        {
            if (Input.GetKey("w"))
            {
                footsteps();
            }

            if (Input.GetKeyDown("s"))
            {
                footsteps();
            }

            if (Input.GetKeyDown("a"))
            {
                footsteps();
            }

            if (Input.GetKeyDown("d"))
            {
                footsteps();
            }

            if (Input.GetKeyUp("w"))
            {
                StopFootsteps();
            }

            if (Input.GetKeyUp("s"))
            {
                StopFootsteps();
            }

            if (Input.GetKeyUp("a"))
            {
                StopFootsteps();
            }

            if (Input.GetKeyUp("d"))
            {
                StopFootsteps();
            }
        }
        else
        {
            StopFootsteps();
        }
      

    }

    void footsteps()
    {
        footstep.SetActive(true);
    }

    void StopFootsteps()
    {
        footstep.SetActive(false);
    }
}
