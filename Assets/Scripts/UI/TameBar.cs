using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TameBar : MonoBehaviour
{
    public Image progressBarImage;

    public void SetProgress(float progress)
    {
        progressBarImage.fillAmount = progress;
    }

    public void SubscribeToDinosaur(Dinosaurio dinosaur)
    {
        dinosaur.onDomesticationChanged.AddListener(SetProgress);
    }
}
