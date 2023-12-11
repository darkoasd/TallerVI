using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivarColliders : MonoBehaviour
{
    [System.Serializable] // Hace que la estructura sea visible en el Inspector de Unity
    public struct TutorialColliderPair
    {
        public string tutorialID;
        public Collider collider;
        public bool activateCollider; 
    }

    [SerializeField]
    private List<TutorialColliderPair> tutorialColliderPairs;

    private void OnEnable()
    {
        TutorialNotify.OnTutorialCompleted += HandleTutorialCompleted;
    }

    private void OnDisable()
    {
        TutorialNotify.OnTutorialCompleted -= HandleTutorialCompleted;
    }

    private void HandleTutorialCompleted(string triggerID)
    {
        foreach (var pair in tutorialColliderPairs)
        {
            if (pair.tutorialID == triggerID && pair.collider != null)
            {
                pair.collider.enabled = pair.activateCollider; // Activa o desactiva según la bandera
                Debug.Log($"Collider {(pair.activateCollider ? "activado" : "desactivado")} para el tutorial {triggerID}.");
                break;
            }
        }
    }
}
