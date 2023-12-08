using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Item : MonoBehaviour
{
   
    public enum ItemType
    {
        
        Weapon,
        Consumable,
        ConsumableTameoCompy,
        ConsumableTameoRaptor,
        QuestItem,
        Miscellaneous,
        AmmoEscopeta,
        AmmoPistola,
        AmmoRifle,
        HealthItem



    }

    public string itemName;
    public int itemID;
    public Sprite itemIcon;
    public ItemType itemType;
    public string description;
    public bool isStackable; // Si el �tem puede apilarse (por ejemplo, pociones)
    public int maxStackAmount; // Si es apilable, �cu�ntos �tems como m�ximo por espacio en el inventario?
    public int municion; // A�ade este campo
    public Arma armaAsociada; // A�adir este campo
    public float healthValue;

    // Variables para la rotaci�n

    // Constructor para facilitar la creaci�n de �tems
    public Item(string _itemName, int _itemID, Sprite _itemIcon, ItemType _itemType, string _description, bool _isStackable = false, int _maxStackAmount = 1)
    {
        itemName = _itemName;
        itemID = _itemID;
        itemIcon = _itemIcon;
        itemType = _itemType;
        description = _description;
        isStackable = _isStackable;
        maxStackAmount = _maxStackAmount;
        
    }
    // M�todo Update para manejar la rotaci�n constante
   
   

}
