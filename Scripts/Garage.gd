extends Node

onready var Player = get_node("/root/Player")
onready var Camera = get_node("/root/Player/Camera2D")
onready var Mom = get_node("/root/Mom")
onready var HUD = get_node("/root/HUD")
onready var Ink_Count : Label = get_node("/root/HUD/Ink_Count")
onready var sceneData = SaveAndLoad.scenesData.Garage 
onready var temporarysceneData = SaveAndLoad.temporary_scenesData.Garage
onready var TextBox = get_node("/root/TextBox")

var door = -1

var RedDoorOpen : bool = false

func _ready():
	_on_enterScene()
	Player.song(2)
	Player.show()
	Ink_Count.text = "Inks = " + str(Player.ink)
	HUD.show()
	HUD.connect("itemUse5", self, "openDoor")
	Player.currentMap = 7
	Camera.limit_right = 1920
	Camera.limit_left = 0

func _on_SaveSpot_pressed():
	if(int(Player.position.x) < 1500 and int(Player.position.x) > 1000):
		Player.interact()
		get_tree().paused = true
		HUD.save("res://Scenes/Garage.tscn")
		
	else:
		TextBox.texts("You're too far.")

func _on_Item_Ink_pressed():
	if(int(Player.position.x) < 1500 and int(Player.position.x) > 1000): 
		Player.itemGetPlay()
		Player.ink += 1
		Ink_Count.text = "Inks = " + str(Player.ink)
		$Control/Botoes/Item_Ink.hide()
		TextBox.texts("You got 1 Ink!")
		temporarysceneData.ink = false
	else:
		TextBox.texts("You're too far.")
	pass # Replace with function body.

func _on_Door_pressed():
	if(int(Player.position.x) < 350 and int(Player.position.x) > -150):
		Player.doorPlay()
		door = 1
	# warning-ignore:return_value_discarded
		$Transition_Scene.transition()
	else:
		TextBox.texts("You're too far.")
	pass # Replace with function body.

func openDoor(object):
	temporarysceneData.door = false
	RedDoorOpen = true
	Player.keyPlay()
	$Control/Environment/RedDoor.hide()
	$Control/Environment/DoorOpen.show()
	object.clearSlot()
	pass

func _on_Transition_Scene_transitioned():
	if(door == 1):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Pantry.tscn")
		Player.position.x = 1850
		Player.position.y = 1000
		Player.show()
	elif(door == 2):
		Camera.zoom = Vector2(1, 1)
		TextBox.layer = 7
		Player.songStop()
		get_tree().change_scene("res://Scenes/Main_Menu.tscn")

func _on_loadScene():
	if(sceneData.ink == false):
		$Control/Botoes/Item_Ink.hide()
	if(sceneData.reddoor == false):
		RedDoorOpen = true
		$Control/Environment/Door.hide()
		$Control/Environment/DoorOpen.show()
	pass
	
func _on_enterScene():
	if(temporarysceneData.ink == false):
		$Control/Botoes/Item_Ink.hide()
	if(temporarysceneData.reddoor == false):
		RedDoorOpen = true
		$Control/Environment/Door.hide()
		$Control/Environment/DoorOpen.show()
	pass


func _on_RedDoor_pressed():
	if(int(Player.position.x) < 750 and int(Player.position.x) > -150):
		if(RedDoorOpen == true):
			Player.doorPlay()
			door = 2
		# warning-ignore:return_value_discarded
			Player.hide()
			TextBox.layer = 101
			TextBox.texts("Charles then managed to escape his house, his fears and achieve his freedom.")
			$Transition_Scene.transition()
		else:
			TextBox.texts("The door is locked.")
	else:
		TextBox.texts("You're too far.")
	pass # Replace with function body.
