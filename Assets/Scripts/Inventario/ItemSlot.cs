using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

    public class ItemSlot : MonoBehaviour
    {
        public Item item; // El �tem que est� en este slot.
        public int quantity; // La cantidad de ese �tem, si es apilable.
        public TMP_Text ammoText;
        public TMP_Text ammoTextMaximo;
        public GameObject ammoTextGameObject;


    }
