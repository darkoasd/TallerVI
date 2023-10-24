using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enciclopedia : MonoBehaviour
{
    public GameManager gamemanager;
    //panels
    public GameObject synomacropsPanel;
    public GameObject raptorPanel;
    public GameObject baryonyxPanel;
    public GameObject triceratopsPanel;
    public GameObject rexPanel;
    public GameObject giganotosaurusPanel;


    private void Update()
    {
       
    }
    public void AbrirSynoma()
    {
        synomacropsPanel.SetActive(true);
        raptorPanel.SetActive(false);
        triceratopsPanel.SetActive(false);
        baryonyxPanel.SetActive(false);
        rexPanel.SetActive(false);
        giganotosaurusPanel.SetActive(false);
    }
    public void AbrirRaptor()
    {
        raptorPanel.SetActive(true);
        synomacropsPanel.SetActive(false);
        triceratopsPanel.SetActive(false);
        baryonyxPanel.SetActive(false);
        rexPanel.SetActive(false);
        giganotosaurusPanel.SetActive(false);
    }
    public void AbrirTriceratops()
    {
        triceratopsPanel.SetActive(true);
        synomacropsPanel.SetActive(false);
        raptorPanel.SetActive(false);
        baryonyxPanel.SetActive(false);
        rexPanel.SetActive(false);
        giganotosaurusPanel.SetActive(false);
    }
    public void AbrirBaryonyx()
    {
        baryonyxPanel.SetActive(true);
        triceratopsPanel.SetActive(false);
        synomacropsPanel.SetActive(false);
        raptorPanel.SetActive(false);
        rexPanel.SetActive(false);
        giganotosaurusPanel.SetActive(false);
    }
    public void AbrirRex()
    {
        rexPanel.SetActive(true);
        baryonyxPanel.SetActive(false);
        triceratopsPanel.SetActive(false);
        synomacropsPanel.SetActive(false);
        raptorPanel.SetActive(false);
        giganotosaurusPanel.SetActive(false);
    }
    public void AbrirGiganoto()
    {
        giganotosaurusPanel.SetActive(true);
        rexPanel.SetActive(false);
        baryonyxPanel.SetActive(false);
        triceratopsPanel.SetActive(false);
        synomacropsPanel.SetActive(false);
        raptorPanel.SetActive(false);
    }
    public void RegresarEnciclopedia()
    {
        gamemanager.abrirEnclicopedia();
        giganotosaurusPanel.SetActive(false);
        rexPanel.SetActive(false);
        baryonyxPanel.SetActive(false);
        triceratopsPanel.SetActive(false);
        synomacropsPanel.SetActive(false);
        raptorPanel.SetActive(false);
    }
    public void CerrarEnciclopedia()
    {
        gamemanager.cerrarEnclicopedia();
    }


}
