using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using System;

public class TutorialNotify : MonoBehaviour
{
    public string[] tutorialMessages;
    public TextMeshProUGUI tutorialTextUI;
    public float messageDisplayTime = 5.0f;
    private int currentMessageIndex = 0;
    private bool messagesShown = false; // Variable para controlar si los mensajes ya se han mostrado
    public string triggerID; // Identificador único para este trigger
    public static event Action<string> OnTutorialCompleted;
    

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") && !messagesShown && tutorialMessages.Length > 0)
        {
            StartCoroutine(ShowMessagesInSequence());
            messagesShown = true; // Marcar los mensajes como mostrados
        }
    }

    private IEnumerator ShowMessagesInSequence()
    {
        while (currentMessageIndex < tutorialMessages.Length)
        {
            tutorialTextUI.text = tutorialMessages[currentMessageIndex];
            tutorialTextUI.gameObject.SetActive(true);

            yield return new WaitForSeconds(messageDisplayTime);

            tutorialTextUI.gameObject.SetActive(false);
            currentMessageIndex++;
        }

        // Restablece el índice para posibles usos futuros, aunque no se volverán a mostrar los mensajes
        currentMessageIndex = 0;
        messagesShown = true;

        // Lanzar el evento al finalizar todos los mensajes
        OnTutorialCompleted?.Invoke(triggerID);
    }
}
