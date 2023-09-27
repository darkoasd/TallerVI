using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuManager : MonoBehaviour
{
    public void CargarTutorial()
    {
        SceneManager.LoadScene("Tutorial");
    }
    public void CargarNivel1()
    {
        SceneManager.LoadScene("Nivel1");
    }
    public void CargarOpciones()
    {
        SceneManager.LoadScene("Opciones");
    }
    public void Salir()
    {
        Application.Quit();
    }
}
