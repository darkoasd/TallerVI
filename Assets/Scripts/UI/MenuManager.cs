using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuManager : MonoBehaviour
{
    [SerializeField] private AudioSource buttonAudioSource;
    [SerializeField] private AudioSource buttonRetryAudioSource;

    [SerializeField] private string sceneToLoad;
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
    public void CargarMenu()
    {
        SceneManager.LoadScene("Menu");
    }
    public void OnButtonClickOpciones()
    {
        // Si el AudioSource y el clip de audio no son null, inicia la Coroutine.
        if (buttonAudioSource != null && buttonAudioSource.clip != null)
        {
            StartCoroutine(PlaySoundAndChangeScene());
        }
        else // Si no hay audio para reproducir, simplemente cambia de escena.
        {
            SceneManager.LoadScene("Opciones");
        }
    }

    private IEnumerator PlaySoundAndChangeScene()
    {
        // Reproduce el sonido del botón.
        buttonAudioSource.Play();

        // Espera mientras el sonido se está reproduciendo.
        yield return new WaitForSeconds(buttonAudioSource.clip.length);

        // Cambia a la nueva escena después de que el sonido ha terminado de reproducirse.
        SceneManager.LoadScene("Opciones");
    }
    public void OnButtonClickNivel()
    {
        // Si el AudioSource y el clip de audio no son null, inicia la Coroutine.
        if (buttonAudioSource != null && buttonAudioSource.clip != null)
        {
            StartCoroutine(PlaySoundAndChangeSceneNivel());
        }
        else // Si no hay audio para reproducir, simplemente cambia de escena.
        {
            SceneManager.LoadScene("Tutorial");
        }
    }
    private IEnumerator PlaySoundAndChangeSceneNivel()
    {
        // Reproduce el sonido del botón.
        buttonAudioSource.Play();

        // Espera mientras el sonido se está reproduciendo.
        yield return new WaitForSeconds(buttonAudioSource.clip.length);

        // Cambia a la nueva escena después de que el sonido ha terminado de reproducirse.
        SceneManager.LoadScene("Tutorial");
    }
    public void OnButtonClickAtrasMenu()
    {
        // Si el AudioSource y el clip de audio no son null, inicia la Coroutine.
        if (buttonRetryAudioSource != null && buttonRetryAudioSource.clip != null)
        {
            StartCoroutine(PlaySoundAndChangeSceneAtrasMenu());
        }
        else // Si no hay audio para reproducir, simplemente cambia de escena.
        {
            SceneManager.LoadScene("Menu");
        }
    }
    private IEnumerator PlaySoundAndChangeSceneAtrasMenu()
    {
        // Reproduce el sonido del botón.
        buttonRetryAudioSource.Play();

        // Espera mientras el sonido se está reproduciendo.
        yield return new WaitForSeconds(buttonRetryAudioSource.clip.length);

        // Cambia a la nueva escena después de que el sonido ha terminado de reproducirse.
        SceneManager.LoadScene("Menu");
    }
    public void OnButtonClickAtrasSalir()
    {
        // Si el AudioSource y el clip de audio no son null, inicia la Coroutine.
        if (buttonRetryAudioSource != null && buttonRetryAudioSource.clip != null)
        {
            StartCoroutine(PlaySoundAndChangeSceneAtrasSalir());
        }
        else // Si no hay audio para reproducir, simplemente cambia de escena.
        {
            Application.Quit();
        }
    }
    private IEnumerator PlaySoundAndChangeSceneAtrasSalir()
    {
        // Reproduce el sonido del botón.
        buttonRetryAudioSource.Play();

        // Espera mientras el sonido se está reproduciendo.
        yield return new WaitForSeconds(buttonRetryAudioSource.clip.length);

        // Cambia a la nueva escena después de que el sonido ha terminado de reproducirse.
        Application.Quit();
    }


}
