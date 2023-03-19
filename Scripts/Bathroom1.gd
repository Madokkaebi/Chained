extends Node

onready var Camera = get_node("/root/Player/Camera2D")
onready var Player = get_node("/root/Player")
onready var Mom = get_node("/root/Mom")
onready var HUD = get_node("/root/HUD")
onready var sceneData = SaveAndLoad.scenesData.Bathroom1 
onready var temporarysceneData = SaveAndLoad.temporary_scenesData.Bathroom1
onready var TextBox = get_node("/root/TextBox")

func _ready():
	_on_enterScene()
	Player.song(1)
	Player.show()
	HUD.show()
	Player.currentMap = 3
	HUD.connect("leaveSafe", self, "exitSafe")
	Camera.limit_right = 1920
	Camera.limit_left = 0

func _on_Door_pressed():
	if(int(Player.position.x) < 1290 and int(Player.position.x) > 590):
		Player.doorPlay()
# warning-ignore:return_value_discarded
		$Transition_Scene.transition()
	else:
		TextBox.texts("You're too far.")

func _on_Key_pressed():
	if(int(Player.position.x) < 2000 and int(Player.position.x) > 1100): 
		var allocatedSlot = HUD.verifySlots()
		if(allocatedSlot == null):
			TextBox.texts("Inventory is full! Use an item before getting this.")
			return
		else:
#			print("Alocando")
			temporarysceneData.key = false
			allocatedSlot.inputSlot("Staircase Key", "Use it to open the staircase-down door on 1F", "key", 2)
			$Control/Botoes/Key.hide()
	else:
		TextBox.texts("You're too far.")
	pass # Replace with function body.

func _on_Transition_Scene_transitioned():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Corridor1.tscn")
	Player.position.x = 1150
	Player.position.y = 1000
	Player.show()
	Mom.show()
	Mom.isEnabled = true;
	Mom.position.x = 119
	Mom.position.y = 1000
	pass

func _on_loadScene():
	if(sceneData.key == false):
		$Control/Botoes/Key.hide()
	pass
	
func _on_enterScene():
	if(temporarysceneData.key == false):
		$Control/Botoes/Key.hide()
	pass


func _on_Safe_pressed():
	if(int(Player.position.x) < 950 and int(Player.position.x) > -1):
		if(Player.isHidden == false):
			Player.hidePlayer()
		else:
			pass
	else:
		TextBox.texts("You're too far.")

func exitSafe():
	Player.unhidePlayer()
	Player.position.x = 622
	Player.position.y = 1000
