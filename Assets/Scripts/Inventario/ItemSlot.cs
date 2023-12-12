using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;

public class ItemSlot : MonoBehaviour
    {
        public Item item; // El �tem que est� en este slot.
        public int quantity; // La cantidad de ese �tem, si es apilable.
    public TextMeshProUGUI tooltipText; // Asigna esto en el Inspector

    public void OnPointerEnter(PointerEventData eventData)
    {
        if (item != null)
        {
            // Actualiza y muestra el tooltip
            tooltipText.text = item.description;
            tooltipText.transform.parent.gameObject.SetActive(true);
            tooltipText.transform.position = eventData.position; // O una posici�n relativa al slot
        }
    }

    // Se llama cuando el cursor sale del �rea del slot
    public void OnPointerExit(PointerEventData eventData)
    {
        // Oculta el tooltip
        tooltipText.transform.parent.gameObject.SetActive(false);
    }
    public void OnSlotSelected()
    {
        Inventory.instance.UpdateItemDescription(item); // Notifica al inventario que este slot ha sido seleccionado
    }



}
