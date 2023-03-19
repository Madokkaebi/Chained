extends Node

onready var Camera = get_node("/root/Player/Camera2D")
onready var Player = get_node("/root/Player")
onready var Mom = get_node("/root/Mom")
onready var HUD = get_node("/root/HUD")
onready var Ink_Count : Label = get_node("/root/HUD/Ink_Count")
onready var sceneData = SaveAndLoad.scenesData.Charlie_Room 
onready var temporarysceneData = SaveAndLoad.temporary_scenesData.Charlie_Room
onready var TextBox = get_node("/root/TextBox")

onready var Door1open : bool = false

func _ready():
	_on_enterScene()
	Player.song(1)
	Player.show()
	Ink_Count.text = "Inks = " + str(Player.ink)
	HUD.show()
	HUD.connect("itemUse1", self, "openDoor")
	Player.currentMap = 1
	Camera.limit_right = 1920
	Camera.limit_left = 0

func _on_SaveSpot_pressed():
	if(int(Player.position.x) < 1450 and int(Player.position.x) > 850):
		Player.interact()
		get_tree().paused = true
		HUD.save("res://Scenes/Charles_Room.tscn")
		
	else:
		TextBox.texts("You're too far.")

func _on_Item_Ink_pressed():
	if(int(Player.position.x) < 2000 and int(Player.position.x) > 1450): 
		Player.itemGetPlay()
		Player.ink += 3
		Ink_Count.text = "Inks = " + str(Player.ink)
		$Control/Botoes/Item_Ink.hide()
		TextBox.texts("You got 3 Inks!")
		temporarysceneData.ink = false
	else:
		TextBox.texts("You're too far.")
	pass # Replace with function body.

func _on_Door_pressed():
	if(int(Player.position.x) < 350 and int(Player.position.x) > -150):
#		print("Porta")
		if(Door1open == true):
#			print("Aberto")
			Player.doorPlay()
# warning-ignore:return_value_discarded
			$Transition_Scene.transition()
		else:
			TextBox.texts("The door's locked.")
			pass
	else:
		TextBox.texts("You're too far.")
	pass # Replace with function body.

func _on_CharlesKey_pressed():
#	print("Interagiu")
	if(int(Player.position.x) < 850 and int(Player.position.x) > 500): 
		var allocatedSlot = HUD.verifySlots()
		if(allocatedSlot == null):
			TextBox.texts("Inventory is full! Use an item before getting this.")
			return
		else:
#			print("Alocando")
			temporarysceneData.key = false
			allocatedSlot.inputSlot("Charles' Key", "Use it to open your room's door", "key", 1)
			$Control/Botoes/CharlesKey.hide()
			pass
	else:
		TextBox.texts("You're too far.")
	pass # Replace with function body.

func openDoor(object):
	temporarysceneData.door = false
	Door1open = true
	Player.keyPlay()
	$Control/Environment/Door.hide()
	$Control/Environment/Door_Light.show()
	object.clearSlot()
	pass

func _on_Transition_Scene_transitioned():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Corridor1.tscn")
	Player.position.x = 1842
	Player.position.y = 1000
	Player.show()
	Mom.show()
	Mom.isEnabled = true;
	Mom.position.x = 119
	Mom.position.y = 1000
	pass

func _on_loadScene():
	if(sceneData.ink == false):
		$Control/Botoes/Item_Ink.hide()
	if(sceneData.key == false):
		$Control/Botoes/CharlesKey.hide()
	if(sceneData.door == false):
		Door1open = true
		$Control/Environment/Door.hide()
		$Control/Environment/Door_Light.show()
	pass
	
func _on_enterScene():
	if(temporarysceneData.ink == false):
		$Control/Botoes/Item_Ink.hide()
	if(temporarysceneData.key == false):
		$Control/Botoes/CharlesKey.hide()
	if(temporarysceneData.door == false):
		Door1open = true
		$Control/Environment/Door.hide()
		$Control/Environment/Door_Light.show()
	pass
