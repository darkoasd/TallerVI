using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EnergyBar : MonoBehaviour
{
    public Slider slider;
    public void SetHealth(int energy)
    {
        slider.value = energy;
    }
    public void SetMaxHealth(int energy)
    {
        slider.maxValue = energy;
        slider.value = energy;
    }
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }
}
