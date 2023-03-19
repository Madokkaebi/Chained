extends Node

onready var Player = get_node("/root/Player")
onready var Camera = get_node("/root/Player/Camera2D")
onready var HUD = get_node("/root/HUD")
onready var sceneData = SaveAndLoad.scenesData.Kitchen
onready var temporarysceneData = SaveAndLoad.temporary_scenesData.Kitchen
var door = -1

func _ready():
	door = -1
	_on_enterScene()
	HUD.show()
	Player.song(1)
	Player.show()
	Player.currentMap = 4
	Camera.limit_right = (1920 + 600)
	HUD.connect("leaveSafe", self, "exitSafe")


func _on_Door_pressed():
	if(int(Player.position.x) < 2600 and int(Player.position.x) > 2200):
		Player.doorPlay()
		$Transition_Scene.transition()
		door = 1
		Mom.hide()
		Mom.isEnabled = false;
	else:
		TextBox.texts("You're too far.")

func _on_Door2_pressed():
	if(int(Player.position.x) < 350 and int(Player.position.x) > -150):
		TextBox.texts("The door is locked")
	else:
		TextBox.texts("You're too far.")


func _on_Safe_pressed():
	if(int(Player.position.x) < 1115 and int(Player.position.x) > 220):
		if(Player.isHidden == false):
			Player.hidePlayer()
		else:
			pass
	else:
		TextBox.texts("You're too far.")


func exitSafe():
	Player.unhidePlayer()
	Player.position.x = 650
	Player.position.y = 1000


func _on_Transition_Scene_transitioned():
	# warning-ignore:return_value_discarded
	Camera.limit_right = 1980
	if(door == 1):
		get_tree().change_scene("res://Scenes/Corridor1.tscn")
		Player.position.x = 94
		Player.position.y = 1000
		Player.show()
		Mom.show()
		Mom.isEnabled = true;
		Mom.position.x = 1800
		Mom.position.y = 1000

	elif(door == 2):
		get_tree().change_scene("res://Scenes/Charles_Room.tscn")
		Player.position.x = 94
		Player.position.y = 1000
		Player.show()
		
	elif(door == 3):
		get_tree().change_scene("res://Scenes/StairsDown1FB1.tscn")
		Player.position.x = 988
		Player.position.y = 1000
		Player.show()
	
func _on_loadScene():
	if(sceneData.halfkey == false):
		$Control/Botoes/RedKey.hide()
	
func _on_enterScene():
	if(temporarysceneData.halfkey == false):
		$Control/Botoes/RedKey.hide()


func _on_Door3_pressed():
	if(int(Player.position.x) < 2400 and int(Player.position.x) > 1500):
		Player.doorPlay()
		$Transition_Scene.transition()
		door = 3
		Mom.hide()
		Mom.isEnabled = false;
	else:
		TextBox.texts("You're too far.")


func _on_RedKey_pressed():
	if(int(Player.position.x) < 390 and int(Player.position.x) > -2):
		var allocatedSlot = HUD.verifySlots()
		if(allocatedSlot == null):
			TextBox.texts("Inventory is full! Use an item before getting this.")
			return
		else:
			temporarysceneData.halfkey = false
			allocatedSlot.inputSlot("Half of Red Key", "This is half of a red key", "redkey1", 3)
			$Control/Botoes/RedKey.hide()
			pass
	else:
		TextBox.texts("You're too far.")
