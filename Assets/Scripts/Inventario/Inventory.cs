using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using TMPro;
public class Inventory : MonoBehaviour
{
    public PlayerMotor player;
    //Inventario
    public List<Item> items = new List<Item>(); // Lista que contiene los ítems.
    public List<int> itemQuantities = new List<int>(); // Lista que contiene las cantidades de cada ítem.
    public List<GameObject> inventorySlots = new List<GameObject>(); // Lista de slots predefinidos.

    //Cinturon
    public List<Item> toolbarItems = new List<Item>(9); // Barra de herramientas con 9 slots.
    public List<int> toolbarItemQuantities = new List<int>(9); // Cantidades de cada ítem en la barra de herramientas.
    public List<GameObject> toolbarSlots = new List<GameObject>(); // Slots predefinidos de la barra de herramientas.

    //DragandDrop
    private Item itemBeingDragged; // Ítem que está siendo arrastrado
    private GameObject slotBeingDraggedFrom; // Slot de donde se tomó el ítem
    public Image draggedItemImage; // Asigna esto en el Inspector a tu GameObject "DraggedItem"
    private Vector2 originalPosition;

    private int itemBeingDraggedQuantity;

    public Item equippedWeapon;
    private int equippedWeaponSlotIndex = -1; // -1 indica que no hay arma equipada

    //Dinos
    public float feedDelay = 5f; // Tiempo de espera en segundos entre alimentaciones
    private float nextFeedTime = 0f; // Tiempo en el que se podrá alimentar nuevamente

    public AudioClip pickupSound; // El sonido de recogida de item
    private AudioSource audioSource; // El componente que reproducirá el sonido

    public TextMeshProUGUI itemDescriptionText;
    public Image itemIconImage;
    public WeaponController weaponController;
    public ActivarPuerta doorController;

    void Start()
    {
        // Inicializa el AudioSource
        audioSource = gameObject.AddComponent<AudioSource>();
        audioSource.playOnAwake = false; // No queremos que el sonido se reproduzca automáticamente al inicio

        // Inicializamos la lista de ítems y cantidades con 30 slots vacíos.
        for (int i = 0; i < 30; i++)
        {
            items.Add(null);
            itemQuantities.Add(0);
        }

        // Inicializamos la lista de slots preexistentes.
        for (int i = 0; i < 30; i++)
        {
            GameObject slot = GameObject.Find("Slot" + (i + 1));
            inventorySlots.Add(slot);
        }
        // Inicializamos la lista de ítems y cantidades de la barra de herramientas con 9 slots vacíos.
        for (int i = 0; i < 9; i++)
        {
            toolbarItems.Add(null);
            toolbarItemQuantities.Add(0);
        }

        // Inicializamos la lista de slots preexistentes de la barra de herramientas.
        for (int i = 0; i < 9; i++)
        {
            GameObject slot = GameObject.Find("ToolbarSlot" + (i + 1));
            toolbarSlots.Add(slot);
        }
    }
    void Update()
    {


        if (equippedWeapon != null && equippedWeapon.itemType == Item.ItemType.Weapon)
        {

            // Aquí tienes un arma equipada, puedes activar y actualizar los textos.
            if (equippedWeapon != null && equippedWeapon.itemType == Item.ItemType.Weapon && equippedWeaponSlotIndex != -1)
            {
                UpdateItemUI(equippedWeaponSlotIndex);
            }
            else
            {
                // Aquí, no tienes un arma equipada, puedes desactivar los textos.
                // ... (código para desactivar la UI)
            }
        }
        else
        {
            // Aquí, no tienes un arma equipada, puedes desactivar los textos.
            // ... (código para desactivar la UI)
        }
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            Debug.Log("Tecla 1 presionada");
            UseItemFromToolbar(0);
        }
        if (Input.GetKeyDown(KeyCode.Alpha2)) UseItemFromToolbar(1);
        if (Input.GetKeyDown(KeyCode.Alpha3)) UseItemFromToolbar(2);
        if (Input.GetKeyDown(KeyCode.Alpha4)) UseItemFromToolbar(3);
        if (Input.GetKeyDown(KeyCode.Alpha5)) UseItemFromToolbar(4);
        if (Input.GetKeyDown(KeyCode.Alpha6)) UseItemFromToolbar(5);
        if (Input.GetKeyDown(KeyCode.Alpha7)) UseItemFromToolbar(6);
        if (Input.GetKeyDown(KeyCode.Alpha8)) UseItemFromToolbar(7);
        if (Input.GetKeyDown(KeyCode.Alpha9)) UseItemFromToolbar(8);
    }


    public void UseItemFromToolbar(int index)
    {
        Debug.Log("UseItemFromToolbar llamado con índice: " + index);

        if (index < 0 || index >= toolbarItems.Count)
        {
            Debug.LogError("Índice fuera de rango.");
            return;
        }

        Item itemToUse = toolbarItems[index];

        if (itemToUse == null)
        {
            Debug.LogWarning("No hay ítem en el slot seleccionado.");
            return;
        }

        // Verificar si ha pasado el tiempo suficiente desde la última alimentación
        if (itemToUse.itemType == Item.ItemType.ConsumableTameoCompy && Time.time < nextFeedTime)
        {
            Debug.LogWarning("Aún no puedes alimentar nuevamente.");
            return;
        }

        Debug.Log("Item a usar: " + itemToUse.itemName);

        switch (itemToUse.itemType)
        {
            case Item.ItemType.Weapon:
                Debug.Log("Intentando equipar arma: " + itemToUse.itemName);
                weaponController.EquipWeapon(itemToUse);
                equippedWeapon = itemToUse;
                equippedWeaponSlotIndex = index;
                break;
            case Item.ItemType.ConsumableTameoCompy:
                Debug.Log("Intentando usar ítem consumible: " + itemToUse.itemName);
                if (player.nearbyCompy.Count > 0 && toolbarItemQuantities[index] > 0)
                {
                    player.nearbyCompy[0].Feed(itemToUse);
                    ReduceItemQuantity(index);
                    nextFeedTime = Time.time + feedDelay;
                }
                break;
            case Item.ItemType.ConsumableTameoRaptor:
                if (player.nearbyRaptor.Count > 0 && toolbarItemQuantities[index] > 0) // Añadimos esta condición
                {
                    player.nearbyRaptor[0].Feed(itemToUse); // Alimentamos al Raptor
                    ReduceItemQuantity(index);
                    nextFeedTime = Time.time + feedDelay;
                }
                break;
            case Item.ItemType.Consumable:
                if (toolbarItemQuantities[index] > 0 && player.currentHealth < player.maxHealth)
                {
                    player.CurarPlayer();

                    ReduceItemQuantity(index);
                }
                else
                {
                    print("Nocuro");
                }
                break;
            case Item.ItemType.HealthItem:
                if (player.nearbyRaptor.Count > 0 && toolbarItemQuantities[index] > 0)
                {
                    Raptor raptor = player.nearbyRaptor[0];
                    if (raptor.isDomesticated && raptor.vida < raptor.vidaMaxima)
                    {
                        raptor.Curar(itemToUse.healthValue); // Método para curar al Raptor
                        ReduceItemQuantity(index);
                    }
                }

                break;

            case Item.ItemType.AmmoEscopeta:

                AddAmmo(TipoBala.Escopeta, itemToUse.municion);

                ReduceItemQuantity(index);

                break;
            case Item.ItemType.AmmoPistola:

                AddAmmo(TipoBala.Pistola, itemToUse.municion);

                ReduceItemQuantity(index);

                break;
            case Item.ItemType.AmmoRifle:

                AddAmmo(TipoBala.Rifle, itemToUse.municion);

                ReduceItemQuantity(index);

                break;

            // Puedes agregar más casos aquí para otros tipos de ítems si lo deseas.
            default:

                Debug.LogWarning("Ítem no reconocido o no usable.");
                break;
        }
    }
    public void ReduceItemQuantity(int index)
    {
        Debug.Log("ReduceItemQuantity llamado con índice: " + index);

        // Verificar que el índice es válido
        if (index < 0 || index >= toolbarItems.Count)
        {
            Debug.LogError("Índice fuera de rango.");
            return;
        }

        Debug.Log("Cantidad antes de reducir: " + toolbarItemQuantities[index]);

        // Reducir la cantidad del ítem
        toolbarItemQuantities[index]--;

        // Verificar si la cantidad es 0 o menos y limpiar el slot si es necesario
        if (toolbarItemQuantities[index] <= 0)
        {
            Debug.Log("Cantidad es 0 o negativa, eliminando ítem del slot.");
            toolbarItems[index] = null;
            toolbarItemQuantities[index] = 0;
        }

        Debug.Log("Cantidad después de reducir: " + toolbarItemQuantities[index]);
        Debug.Log("Ítem en el índice después de reducir: " + (toolbarItems[index] == null ? "null" : toolbarItems[index].itemName));

        // Actualizar la UI
        UpdateToolbarItemUI(index);
    }




    public void StartDragging(GameObject slot, Item item)
    {
        ItemSlot itemSlot = slot.GetComponent<ItemSlot>();
        itemBeingDraggedQuantity = itemSlot.quantity;  // Guarda la cantidad actual del ítem
        Debug.Log($"Comenzando a arrastrar desde {slot.name}");
        itemBeingDragged = item;
        slotBeingDraggedFrom = slot;

        originalPosition = draggedItemImage.rectTransform.anchoredPosition;
        // Desactiva solo el ícono del ítem en el slot original
        Image slotIcon = slot.transform.Find("ItemIcon").GetComponent<Image>();
        if (slotIcon != null)
        {
            slotIcon.enabled = false;
        }

        // Activa y configura el "ítem fantasma" en el objeto draggedItem
        draggedItemImage.sprite = item.itemIcon;
        draggedItemImage.enabled = true;
    }
    public void StopDragging(GameObject slot)
    {
        Debug.Log($"Finalizando arrastre en {slot.name}");

        if (slot == null)
        {
            Debug.LogError("El slot donde finalizó el arrastre es nulo.");
            return;
        }

        if (itemBeingDragged != null)
        {
            // Si el ítem no se movió a un nuevo slot
            if (slot == slotBeingDraggedFrom)
            {
                Image slotIcon = slot.transform.Find("ItemIcon").GetComponent<Image>();
                if (slotIcon != null)
                {
                    slotIcon.enabled = true; // Reactiva el ícono del ítem
                }
            }
            else
            {
                Debug.Log($"Cantidad antes del intercambio: {slotBeingDraggedFrom.GetComponent<ItemSlot>().quantity} -> {slot.GetComponent<ItemSlot>().quantity}");
                SwapItems(slotBeingDraggedFrom, slot);
                Debug.Log($"Cantidad después del intercambio: {slotBeingDraggedFrom.GetComponent<ItemSlot>().quantity} -> {slot.GetComponent<ItemSlot>().quantity}");
            }

            // Siempre apaga el ícono "fantasma" después de arrastrar
            draggedItemImage.enabled = false;

            draggedItemImage.rectTransform.anchoredPosition = originalPosition;

            itemBeingDragged = null;

            // Después de realizar el intercambio, verifica si el ítem ha sido movido entre el inventario y la barra de herramientas:
            int fromInventoryIndex = inventorySlots.IndexOf(slotBeingDraggedFrom);
            int toInventoryIndex = inventorySlots.IndexOf(slot);
            int fromToolbarIndex = toolbarSlots.IndexOf(slotBeingDraggedFrom);
            int toToolbarIndex = toolbarSlots.IndexOf(slot);

            if (fromInventoryIndex != -1 && toToolbarIndex != -1)
            {
                MoveItemToToolbar(fromInventoryIndex, toToolbarIndex);
            }
            else if (fromToolbarIndex != -1 && toInventoryIndex != -1)
            {
                MoveItemToInventory(fromToolbarIndex, toInventoryIndex);
            }

            slotBeingDraggedFrom = null;
        }
    }
    public void OnDrag(BaseEventData data)
    {
        PointerEventData pointerData = data as PointerEventData;
        if (pointerData != null)
        {
            UpdateDraggedItemImagePosition(pointerData);
        }
    }
    public void BeginDrag(BaseEventData data)
    {
        Debug.Log("Comenzando a arrastrar");
        PointerEventData pointerData = data as PointerEventData;
        if (pointerData != null)
        {
            GameObject slot = pointerData.pointerDrag;
            Item item = slot.GetComponent<ItemSlot>().item;
            if (item == null)
            {
                Debug.LogError("No hay ítem en el slot: " + slot.name);
                return;
            }
            StartDragging(slot, item);
        }
    }

    public void EndDrag(BaseEventData data)
    {

        Debug.Log("Finalizando arrastre");
        PointerEventData pointerData = data as PointerEventData;
        if (pointerData != null)
        {
            GameObject slot = pointerData.pointerCurrentRaycast.gameObject;

            if (slot == null)
            {
                StopDragging(slotBeingDraggedFrom);
                return;
            }

            if (slot.name.Contains("ItemIcon") || !slot.name.Contains("Slot"))
            {
                slot = slot.transform.parent.gameObject;
            }

            StopDragging(slot);
        }
    }
    private void SwapItems(GameObject from, GameObject to)
    {
        if (to.name == "ItemSlotFantasma")
        {
            Debug.LogWarning("Intento de intercambio con el slot fantasma. Ignorando.");
            int index = inventorySlots.IndexOf(from);
            if (index != -1) UpdateItemUI(index);
            else
            {
                index = toolbarSlots.IndexOf(from);
                if (index != -1) UpdateToolbarItemUI(index);
            }
            return;
        }

        if (from == null || to == null)
        {
            Debug.LogError("Uno de los slots es nulo en SwapItems.");
            return;
        }

        ItemSlot fromSlot = from.GetComponent<ItemSlot>();
        ItemSlot toSlot = to.GetComponent<ItemSlot>();

        if (fromSlot == null || toSlot == null)
        {
            Debug.LogError("Uno de los slots no tiene el componente ItemSlot adjunto.");
            return;
        }

        // Determinar si el intercambio es entre el inventario y la barra de herramientas o solo en el inventario:
        int fromIndex = inventorySlots.IndexOf(from);
        int toIndex = inventorySlots.IndexOf(to);

        if (fromIndex != -1 && toIndex != -1) // Ambos slots están en el inventario
        {
            // Intercambiar en la lista de ítems y cantidades del inventario
            Item tempListItem = items[fromIndex];
            int tempQuantityItem = itemQuantities[fromIndex];

            items[fromIndex] = items[toIndex];
            itemQuantities[fromIndex] = itemQuantities[toIndex];

            items[toIndex] = tempListItem;
            itemQuantities[toIndex] = tempQuantityItem;
        }
        else
        {
            fromIndex = toolbarSlots.IndexOf(from);
            toIndex = toolbarSlots.IndexOf(to);
            if (fromIndex != -1 && toIndex != -1) // Ambos slots están en la barra de herramientas
            {
                // Intercambiar en la lista de ítems y cantidades de la barra de herramientas
                Item tempToolbarItem = toolbarItems[fromIndex];
                int tempToolbarQuantity = toolbarItemQuantities[fromIndex];

                toolbarItems[fromIndex] = toolbarItems[toIndex];
                toolbarItemQuantities[fromIndex] = toolbarItemQuantities[toIndex];

                toolbarItems[toIndex] = tempToolbarItem;
                toolbarItemQuantities[toIndex] = tempToolbarQuantity;
            }
            // Aquí puedes manejar otros casos, como el intercambio entre inventario y barra de herramientas si lo necesitas
        }

        // Intercambiar en los componentes ItemSlot
        Item tempItem = fromSlot.item;
        int tempQuantity = fromSlot.quantity;

        fromSlot.item = toSlot.item;
        fromSlot.quantity = toSlot.quantity;

        toSlot.item = tempItem;
        toSlot.quantity = tempQuantity;

        // Actualizar la UI de ambos slots
        fromIndex = inventorySlots.IndexOf(from);
        toIndex = inventorySlots.IndexOf(to);

        if (fromIndex != -1) UpdateItemUI(fromIndex);
        else
        {
            fromIndex = toolbarSlots.IndexOf(from);
            if (fromIndex != -1) UpdateToolbarItemUI(fromIndex);
        }

        if (toIndex != -1) UpdateItemUI(toIndex);
        else
        {
            toIndex = toolbarSlots.IndexOf(to);
            if (toIndex != -1) UpdateToolbarItemUI(toIndex);
        }
    }


    private void UpdateDraggedItemImagePosition(PointerEventData pointerEventData)
    {
        if (draggedItemImage != null)
        {
            draggedItemImage.rectTransform.position = pointerEventData.position;
        }
    }
    public static Inventory instance;

    void Awake()
    {
        if (instance != null)
        {
            Debug.LogWarning("More than one instance of Inventory found!");
            return;
        }
        instance = this;
    }
    private bool TryStackItemInInventory(List<Item> itemList, List<int> itemQuantityList, List<GameObject> slotList, Item itemToAdd)
    {

        for (int i = 0; i < itemList.Count; i++)
        {
            if (itemList[i] != null && itemList[i].itemName == itemToAdd.itemName && itemQuantityList[i] < itemList[i].maxStackAmount)
            {
                itemQuantityList[i]++;
                slotList[i].GetComponent<ItemSlot>().quantity = itemQuantityList[i];
                UpdateItemUI(i); // Asumiendo que UpdateItemUI maneja ambos inventarios
                UpdateToolbarItemUI(i);
                return true; // Ítem stackeado exitosamente
            }
        }
        return false; // No se encontró un slot para stackear
    }

    private bool AddItemToEmptySlot(List<Item> itemList, List<int> itemQuantityList, List<GameObject> slotList, Item itemToAdd)
    {
        for (int i = 0; i < itemList.Count; i++)
        {
            if (itemList[i] == null)
            {
                itemList[i] = itemToAdd;
                itemQuantityList[i] = 1;
                slotList[i].GetComponent<ItemSlot>().item = itemToAdd;
                slotList[i].GetComponent<ItemSlot>().quantity = 1;
                UpdateItemUI(i); // Asumiendo que UpdateItemUI maneja ambos inventarios
                UpdateToolbarItemUI(i);
                return true; // Ítem agregado exitosamente
            }
        }
        return false; // No se encontró un slot vacío
    }
    public void AddItem(Item item)
    {
        if (item.itemID == 20)
        {
            doorController.UnlockDoor();
        }
        if (TryStackItemInInventory(items, itemQuantities, inventorySlots, item))
        {
            return;
        }

        // Intenta stackear el ítem en el cinturón de herramientas
        if (TryStackItemInInventory(toolbarItems, toolbarItemQuantities, toolbarSlots, item))
        {
            return;
        }

        // Si el ítem no se stackeó, busca un slot vacío en el inventario principal para agregarlo
        if (AddItemToEmptySlot(items, itemQuantities, inventorySlots, item))
        {
            return;
        }

        // Si aún no se ha agregado, busca un slot vacío en el cinturón de herramientas
        AddItemToEmptySlot(toolbarItems, toolbarItemQuantities, toolbarSlots, item);

        bool itemAdded = false;
        if (item.isStackable)
        {
            for (int i = 0; i < items.Count; i++)
            {
                if (items[i] != null && items[i].itemName == item.itemName && itemQuantities[i] < items[i].maxStackAmount)
                {
                    // Aumenta la cantidad y actualiza la UI
                    itemQuantities[i]++;
                    inventorySlots[i].GetComponent<ItemSlot>().quantity = itemQuantities[i];
                    UpdateItemUI(i);
                    return; // Finaliza el método aquí si el ítem se stackeó exitosamente
                }
            }
        }

        if (!itemAdded)
        {
            for (int i = 0; i < items.Count; i++)
            {
                if (items[i] == null)
                {
                    items[i] = item;
                    if (item.itemType == Item.ItemType.Weapon)
                    {
                        item.armaAsociada.SlotIndex = i;
                    }
                    items[i] = item;
                    itemQuantities[i] = 1; // Establece la cantidad inicial del ítem
                    inventorySlots[i].GetComponent<ItemSlot>().item = item;
                    inventorySlots[i].GetComponent<ItemSlot>().quantity = 1;
                    UpdateItemUI(i);
                    break; // Finaliza el bucle una ve
                }
            }
        }

        // Reproduce el sonido de recogida de item
        if (audioSource != null && pickupSound != null)
        {
            audioSource.PlayOneShot(pickupSound);
        }
    }
    public void UpdateItemDescription(Item selectedItem)
    {
        if (selectedItem != null)
        {
            itemDescriptionText.text = selectedItem.description; // Actualizar descripción
            itemIconImage.sprite = selectedItem.itemIcon; // Actualizar icono del ítem
            itemIconImage.enabled = true; // Asegúrate de habilitar la imagen si está deshabilitada
        }
        else
        {
            itemDescriptionText.text = ""; // Limpiar descripción
            itemIconImage.sprite = null; // Limpiar icono del ítem
            itemIconImage.enabled = false; // Opcionalmente, puedes deshabilitar la imagen si no hay ítem
        }
    }
    public int GetItemQuantity(Item itemBuscado)
    {
        for (int i = 0; i < items.Count; i++)
        {
            if (items[i] != null && items[i].itemName == itemBuscado.itemName)
            {
                return itemQuantities[i];
            }
        }
        return 0; // Retorna 0 si el ítem no se encuentra en el inventario
    }
    public void UpdateItemUI(int index)
    {

        Debug.Log("Actualizando UI del ítem en el índice: " + index);
        GameObject slotObj = inventorySlots[index];
        if (slotObj == null)
        {
            Debug.LogError("SlotObj es null en el índice: " + index);
            return;
        }

        ItemSlot slot = slotObj.GetComponent<ItemSlot>();
        Image itemIcon = slotObj.transform.Find("ItemIcon").GetComponent<Image>();
        TextMeshProUGUI itemCountText = slotObj.GetComponentInChildren<TextMeshProUGUI>();

        if (slot.item != null)
        {
            itemIcon.sprite = slot.item.itemIcon;
            itemIcon.enabled = true;

            if (slot.item.isStackable && itemCountText != null)
            {
                itemCountText.text = itemQuantities[index].ToString();
            }
            else if (itemCountText != null)
            {
                itemCountText.text = "";
            }

            if (slot.item.itemType == Item.ItemType.Weapon)
            {
                Arma arma = slot.item.armaAsociada;
                if (arma != null)
                {
                    Debug.Log("Arma asociada encontrada. Municion: " + arma.municion + "/" + arma.municionMaxima);
                    // Actualiza el texto de munición usando el método en ItemSlot

                }
                else
                {
                    Debug.LogWarning("El ítem en el slot es de tipo arma, pero no tiene una arma asociada.");
                }
            }
            else
            {
                Debug.LogWarning("El ítem en el slot no es de tipo arma.");
            }
        }
        else
        {
            itemIcon.sprite = null;
            itemIcon.enabled = false;

            if (itemCountText != null)
            {
                itemCountText.text = "";
            }


            Debug.Log("Slot vacío");
        }
    }
    public void RemoveItemFromToolbar(int slotIndex, int quantity)
    {
        // Verificar que el slotIndex es válido y que hay un ítem en el slot
        if (slotIndex >= 0 && slotIndex < toolbarItems.Count && toolbarItems[slotIndex] != null)
        {
            // Reducir la cantidad de ítems en el slot
            toolbarItemQuantities[slotIndex] -= quantity;

            // Si la cantidad de ítems en el slot es 0 o menos, limpiar el slot
            if (toolbarItemQuantities[slotIndex] <= 0)
            {
                toolbarItems[slotIndex] = null;
                toolbarItemQuantities[slotIndex] = 0;
            }

            // Actualizar la UI del toolbar
            UpdateToolbarItemUI(slotIndex);
        }
    }

    public void UpdateToolbarItemUI(int index)
    {
        Debug.Log("Actualizando UI de la barra de herramientas en el índice: " + index);

        GameObject slotObj = toolbarSlots[index];
        ItemSlot slot = slotObj.GetComponent<ItemSlot>();
        Image itemIcon = slotObj.transform.Find("ItemIcon").GetComponent<Image>();
        TextMeshProUGUI itemCountText = slotObj.GetComponentInChildren<TextMeshProUGUI>();

        // Si el ítem es null, ocultar su icono/imagen en la UI
        if (toolbarItems[index] == null)
        {
            itemIcon.sprite = null;
            itemIcon.enabled = false;

            if (itemCountText != null)
            {
                itemCountText.text = "";
            }
        }
        else // Si el ítem no es null, mostrar su icono/imagen en la UI
        {
            itemIcon.sprite = toolbarItems[index].itemIcon;
            itemIcon.enabled = true;

            if (toolbarItems[index].isStackable && itemCountText != null)
            {
                itemCountText.text = toolbarItemQuantities[index].ToString();
            }
            else if (itemCountText != null)
            {
                itemCountText.text = "";
            }

            if (toolbarItems[index].itemType == Item.ItemType.Weapon)
            {
                Arma arma = toolbarItems[index].armaAsociada;
                // Código adicional para manejar armas...
            }
        }

    }
    public bool IntercambiarPorCantidad(Item itemOfrecido, int cantidadOfrecida, Item itemDeseado)
    {
        Debug.Log($"Intentando intercambiar {cantidadOfrecida} de {itemOfrecido.itemName} por {itemDeseado.itemName}");

        for (int i = 0; i < items.Count; i++)
        {
            if (items[i] != null && items[i].itemName == itemOfrecido.itemName)
            {
                Debug.Log($"Encontrado {itemOfrecido.itemName} en el inventario con cantidad {itemQuantities[i]}");

                if (itemQuantities[i] >= cantidadOfrecida)
                {
                    Debug.Log($"Hay suficiente cantidad para el intercambio. Procediendo a intercambiar.");

                    itemQuantities[i] -= cantidadOfrecida;
                    Debug.Log($"Cantidad de {itemOfrecido.itemName} después del intercambio: {itemQuantities[i]}");

                    if (itemQuantities[i] == 0)
                    {
                        items[i] = null;
                        Debug.Log($"El ítem {itemOfrecido.itemName} ha sido eliminado del inventario.");
                    }

                    if (itemDeseado.itemName != itemOfrecido.itemName || !itemDeseado.isStackable)
                    {
                        AddItem(itemDeseado);
                        Debug.Log($"Ítem {itemDeseado.itemName} agregado al inventario.");

                    }
                    return true;
                }
                else
                {
                    Debug.Log($"No hay suficiente cantidad de {itemOfrecido.itemName} para el intercambio.");
                    return false;
                }
            }
        }

        Debug.Log($"El ítem ofrecido {itemOfrecido.itemName} no se encuentra en el inventario.");
        return false;
    }

    public bool RemoveItem(Item item, int cantidad)
    {
        for (int i = 0; i < items.Count; i++)
        {
            if (items[i] != null && items[i].itemName == item.itemName)
            {
                if (itemQuantities[i] >= cantidad)
                {
                    itemQuantities[i] -= cantidad;
                    if (itemQuantities[i] == 0)
                    {
                        items[i] = null; // Elimina el ítem si la cantidad llega a 0
                    }
                    return true; // Retorna true si el ítem fue eliminado exitosamente
                }
                break; // Sale del bucle si encuentra el ítem pero no tiene suficiente cantidad
            }
        }
        return false; // Retorna false si no encuentra el ítem o no tiene suficiente cantidad
    }
    public void MoveItemToToolbar(int inventoryIndex, int toolbarIndex)
    {
        Debug.Log("Moviendo ítem desde el inventario al índice de la barra de herramientas: " + toolbarIndex);
        if (items[inventoryIndex] != null && toolbarItems[toolbarIndex] == null)
        {
            toolbarItems[toolbarIndex] = items[inventoryIndex];
            if (toolbarItems[toolbarIndex].itemType == Item.ItemType.Weapon)
            {
                toolbarItems[toolbarIndex].armaAsociada.SlotIndex = toolbarIndex;
            }

            toolbarItemQuantities[toolbarIndex] = itemQuantities[inventoryIndex];

            items[inventoryIndex] = null;
            inventorySlots[inventoryIndex].GetComponent<ItemSlot>().item = null;
            itemQuantities[inventoryIndex] = 0;

            UpdateItemUI(inventoryIndex);
            UpdateToolbarItemUI(toolbarIndex);
        }
    }
    public bool HasItem(Item item)
    {
        return items.Contains(item);
    }

    public void MoveItemToInventory(int toolbarIndex, int inventoryIndex)
    {
        Debug.Log("Moviendo ítem desde la barra de herramientas al índice del inventario: " + inventoryIndex);
        // ... (código existente)

        if (toolbarItems[toolbarIndex] != null && items[inventoryIndex] == null)
        {
            items[inventoryIndex] = toolbarItems[toolbarIndex];
            itemQuantities[inventoryIndex] = toolbarItemQuantities[toolbarIndex];

            toolbarItems[toolbarIndex] = null;
            toolbarItemQuantities[toolbarIndex] = 0;

            UpdateItemUI(inventoryIndex);
            UpdateToolbarItemUI(toolbarIndex);
        }
    }

    public void AddAmmo(TipoBala tipoBala, int cantidad)
    {
        // Encuentra el arma que utiliza este tipo de bala
        Arma arma = FindWeaponUsingAmmoType(tipoBala);
        if (arma != null)
        {
            arma.municionReserva += cantidad;
            // Asegúrate de que la munición en reserva no excede el máximo
            arma.municionReserva = Mathf.Min(arma.municionReserva, arma.municionReservaMaxima);
        }
        else
        {
            Debug.LogWarning("No se encontró un arma que utilice este tipo de bala: " + tipoBala);
        }
    }

    private Arma FindWeaponUsingAmmoType(TipoBala tipoBala)
    {
        // Busca entre todas las armas en la escena (o en tu inventario) y encuentra la que utiliza este tipo de bala
        Arma[] todasLasArmas = FindObjectsOfType<Arma>();
        foreach (Arma arma in todasLasArmas)
        {
            if (arma.tipoBala == tipoBala)
            {
                return arma;
            }
        }
        return null;
    }
}

