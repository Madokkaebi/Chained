extends CanvasLayer

var inventoryOpen : bool = false

var currentMap

func _ready():
	$InventoryButton.show()
	

func show():
	$Ink_Count.hide()
	$InventoryButton.show()
	$Pause.show()

func hide():
	$Ink_Count.hide()
	$InventoryButton.hide()
	$Pause.hide()
	$Sair.hide()

var selectedSlot = null
var selectedSlot2 = null

var combineOn : bool = false

signal leaveSafe

signal itemUse1(object)
signal itemUse2(object)
signal itemUse5(object)

onready var Player = get_node("/root/Player/")
onready var TextBox = get_node("/root/TextBox/")

func _process(_delta):
	if((selectedSlot != null) and (selectedSlot.itemNum == 3 or selectedSlot.itemNum == 4)):
		$InventoryButton/Inventory/Commands/Combine.show()
	else:
		$InventoryButton/Inventory/Commands/Combine.hide()

func _input(_event):
	if (Input.is_action_pressed("menu")):
		_on_InventoryButton_pressed()
	if (Input.is_action_pressed("pause")):
		_on_Pause_pressed()

func _on_InventoryButton_pressed():
	Player.interact()
	if(inventoryOpen == false):
		$InventoryButton/Inventory.show()
		inventoryOpen = true
	else:
		$InventoryButton/Inventory/Commands.hide()
		$InventoryButton/Inventory.hide()
		inventoryOpen = false
	pass # Replace with function body.

func verifySlots():
	if($InventoryButton/Inventory/Slot1.isOccupied == false):
		return $InventoryButton/Inventory/Slot1
	elif($InventoryButton/Inventory/Slot2.isOccupied == false):
		return $InventoryButton/Inventory/Slot2
	elif($InventoryButton/Inventory/Slot3.isOccupied == false):
		return $InventoryButton/Inventory/Slot3
	elif($InventoryButton/Inventory/Slot4.isOccupied == false):
		return $InventoryButton/Inventory/Slot4
	elif($InventoryButton/Inventory/Slot5.isOccupied == false):
		return $InventoryButton/Inventory/Slot5
	else:
#		print("Inventário cheio")
		return null
		

func _on_Slot1_pressed():
	if($InventoryButton/Inventory/Slot1.isOccupied == true):
		Player.interact()
		$InventoryButton/Inventory/Commands.show()
		selectedSlot = $InventoryButton/Inventory/Slot1
	pass # Replace with function body.


func _on_Slot2_pressed():
	if($InventoryButton/Inventory/Slot2.isOccupied == true):
		Player.interact()
		$InventoryButton/Inventory/Commands.show()
		selectedSlot = $InventoryButton/Inventory/Slot2
	pass # Replace with function body.


func _on_Slot3_pressed():
	if($InventoryButton/Inventory/Slot3.isOccupied == true):
		Player.interact()
		$InventoryButton/Inventory/Commands.show()
		selectedSlot = $InventoryButton/Inventory/Slot3
	pass # Replace with function body.


func _on_Slot4_pressed():
	if($InventoryButton/Inventory/Slot4.isOccupied == true):
		Player.interact()
		$InventoryButton/Inventory/Commands.show()
		selectedSlot = $InventoryButton/Inventory/Slot4
	pass # Replace with function body.


func _on_Slot5_pressed():
	if($InventoryButton/Inventory/Slot5.isOccupied == true):
		Player.interact()
		$InventoryButton/Inventory/Commands.show()
		selectedSlot = $InventoryButton/Inventory/Slot5
	pass # Replace with function body.


func itemUse(object):
#	print("Item Use")
	match object.itemNum:
		1:
			emit_signal("itemUse1", object)
			pass
		2:
			emit_signal("itemUse2", object)
			pass
		3:
			TextBox.texts("This is just half of the key, you can't use it alone.")
		4:
			TextBox.texts("This is just half of the key, you can't use it alone.")
		5:
			emit_signal("itemUse5", object)
			pass

func itemInspect(slot):
#	print("Item Use")
		TextBox.texts(slot.itemDescription)

func _on_Use_pressed():
#	print("Use")
	Player.interact()
	$InventoryButton/Inventory/Commands.hide()
	itemUse(selectedSlot)
	pass # Replace with function body.


func sairShow():
	$Sair.show()

func sairHide():
	$Sair.hide()

func _on_Sair_pressed():
	emit_signal("leaveSafe")
	pass # Replace with function body.


func _on_Pause_pressed():
	get_tree().paused = true
	PauseScreen.showAll()
	pass


func _on_Inspect_pressed():
	itemInspect(selectedSlot)
	pass # Replace with function body.


func save(map):
	currentMap = map
	$SaveConfirm.show()
	$SaveConfirm/Yes.show()
	$SaveConfirm/No.show()
	$Ink_Count.show()
	$Ink_Count/InkSprite.show()

func _on_Yes_pressed():
	Player.interact()
	if(Player.ink > 0):
		Player.savePlay()
		Player.ink -= 1
		$Ink_Count.text = "Inks = " + str(Player.ink)
		$SaveConfirm/Yes.hide()
		$SaveConfirm/No.hide()
		$SaveConfirm.hide()
		$Ink_Count.hide()
		SaveAndLoad.save_game(currentMap)
		TextBox.texts("Your progress has been saved!")
	else:
		TextBox.texts("Not enough inks!")
		$SaveConfirm/Yes.hide()
		$SaveConfirm/No.hide()
		$SaveConfirm.hide()
		$Ink_Count.hide()
		
	get_tree().paused = false


func _on_No_pressed():
	Player.interact()
	$SaveConfirm/Yes.hide()
	$SaveConfirm/No.hide()
	$SaveConfirm.hide()
	$Ink_Count.hide()
	
	get_tree().paused = false


func _on_Combine_pressed():
	if(selectedSlot2 == null):
		selectedSlot2 = selectedSlot
	else:
		if(selectedSlot2 != selectedSlot):
			if((selectedSlot.itemNum == 3 and selectedSlot2.itemNum == 4) or (selectedSlot2.itemNum == 3 and selectedSlot.itemNum == 4)):
				selectedSlot.clearSlot()
				selectedSlot2.clearSlot()
				var allocatedSlot = HUD.verifySlots()
				if(allocatedSlot == null):
					TextBox.texts("Inventory is full! Use an item before combining these.")
					return
				else:
					allocatedSlot.inputSlot("Red Key", "Use it to open the Red Door", "redkey", 5)
					pass
