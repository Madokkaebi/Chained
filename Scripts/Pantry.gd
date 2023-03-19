extends Node

onready var Camera = get_node("/root/Player/Camera2D")
onready var Player = get_node("/root/Player")
onready var HUD = get_node("/root/HUD")
onready var sceneData = SaveAndLoad.scenesData.Pantry
onready var temporarysceneData = SaveAndLoad.temporary_scenesData.Pantry
var door = -1

func _ready():
	door = -1
	_on_enterScene()
	HUD.show()
	Player.song(2)
	Player.show()
	Player.currentMap = 6
	Camera.limit_right = 1920
	Camera.limit_left = 0
	HUD.connect("leaveSafe", self, "exitSafe")


func _on_Door_pressed():
	if(int(Player.position.x) < 2000 and int(Player.position.x) > 1700):
		door = 1
		Player.doorPlay()
		Mom.hide()
		Mom.isEnabled = false;
		$Transition_Scene.transition()
	else:
		TextBox.texts("You're too far.")

func _on_Stairs_pressed():
	if(int(Player.position.x) < 350 and int(Player.position.x) > -150):
		door = 2
		Player.doorPlay()
		Mom.hide()
		Mom.isEnabled = false;
		$Transition_Scene.transition()
	else:
		TextBox.texts("You're too far.")


func _on_Safe_pressed():
	if(int(Player.position.x) < 850 and int(Player.position.x) > 0): 
		if(Player.isHidden == false):
			Player.hidePlayer()
		else:
			pass
	else:
		TextBox.texts("You're too far.")


func exitSafe():
	Player.unhidePlayer()
	Player.position.x = 590
	Player.position.y = 1000


func _on_Transition_Scene_transitioned():
	# warning-ignore:return_value_discarded
	if(door == 1):
		get_tree().change_scene("res://Scenes/Garage.tscn")
		Player.position.x = 94
		Player.position.y = 1000
		Player.show()
		Mom.hide()
		Mom.isEnabled = false;
	elif(door == 2):
		get_tree().change_scene("res://Scenes/StairsDown1FB1.tscn")
		Player.position.x = 1390
		Player.position.y = 1000
		Player.show()
		Mom.hide()
		Mom.isEnabled = false;
		Mom.position.x = 119
		Mom.position.y = 1000
	
func _on_loadScene():
	if(sceneData.key == false):
		$Control/Botoes/RedKey.hide()
	
func _on_enterScene():
	if(temporarysceneData.key == false):
		$Control/Botoes/RedKey.hide()


func _on_RedKey_pressed():
	if(int(Player.position.x) < 1500 and int(Player.position.x) > 940):
		var allocatedSlot = HUD.verifySlots()
		if(allocatedSlot == null):
			TextBox.texts("Inventory is full! Use an item before getting this.")
			return
		else:
			temporarysceneData.key = false
			allocatedSlot.inputSlot("Half of Red Key", "This is half of a red key", "redkey2", 4)
			$Control/Botoes/RedKey.hide()
			pass
	else:
		TextBox.texts("You're too far.")
