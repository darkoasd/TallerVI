using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using System;

public class TutorialNotify : MonoBehaviour
{
    public string[] tutorialMessages;
    public bool[] timedMessages; // Indica si cada mensaje es temporal o no
    public TextMeshProUGUI tutorialTextUI;
    public float messageDisplayTime = 5.0f;
    private int currentMessageIndex = 0;
    private bool messagesShown = false;
    public string triggerID;
    public static event Action<string> OnTutorialCompleted;

    private void Start()
    {
        // Asegurarse de que timedMessages tenga la misma longitud que tutorialMessages
        if (timedMessages.Length != tutorialMessages.Length)
        {
            Debug.LogError("La longitud de timedMessages debe ser igual a la de tutorialMessages");
            timedMessages = new bool[tutorialMessages.Length];
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") && !messagesShown && tutorialMessages.Length > 0)
        {
            StartCoroutine(ShowMessagesInSequence());
            messagesShown = true;
        }
    }

    private IEnumerator ShowMessagesInSequence()
    {
        while (currentMessageIndex < tutorialMessages.Length)
        {
            tutorialTextUI.text = tutorialMessages[currentMessageIndex];
            tutorialTextUI.gameObject.SetActive(true);

            if (timedMessages[currentMessageIndex])
            {
                yield return new WaitForSeconds(messageDisplayTime);
                tutorialTextUI.gameObject.SetActive(false);
            }
            else
            {
                yield return new WaitUntil(() => Input.GetMouseButton(0)); // Esperar a que el jugador presione una tecla para continuar
            }

            currentMessageIndex++;
        }

        currentMessageIndex = 0;
        messagesShown = true;
        OnTutorialCompleted?.Invoke(triggerID);
    }
}
