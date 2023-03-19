extends Node

onready var Camera = get_node("/root/Player/Camera2D")
onready var Player = get_node("/root/Player")
onready var HUD = get_node("/root/HUD")
onready var sceneData = SaveAndLoad.scenesData.Corridor1
onready var temporarysceneData = SaveAndLoad.temporary_scenesData.Corridor1
var door = -1

func _ready():
	door = -1
	_on_enterScene()
	HUD.show()
	Player.song(1)
	Player.show()
	Player.currentMap = 2
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

func _on_Door2_pressed():
	if(int(Player.position.x) < 350 and int(Player.position.x) > -150):
		door = 2
		Player.doorPlay()
		Mom.hide()
		Mom.isEnabled = false;
		$Transition_Scene.transition()
	else:
		TextBox.texts("You're too far.")


func _on_Safe_pressed():
	if(int(Player.position.x) < 950 and int(Player.position.x) > 150):
		if(Player.isHidden == false):
			Player.hidePlayer()
		else:
			pass
	else:
		TextBox.texts("You're too far.")


func exitSafe():
	Player.unhidePlayer()
	Player.position.x = 570
	Player.position.y = 1000


func _on_Transition_Scene_transitioned():
	# warning-ignore:return_value_discarded
	if(door == 1):
		get_tree().change_scene("res://Scenes/Charles_Room.tscn")
		Player.position.x = 94
		Player.position.y = 1000
		Player.show()
		Mom.hide()
		Mom.isEnabled = false;
	elif(door == 2):
		get_tree().change_scene("res://Scenes/Kitchen.tscn")
		Player.position.x = 2500
		Player.position.y = 1000
		Player.show()
		Mom.show()
		Mom.isEnabled = true;
		Mom.position.x = 119
		Mom.position.y = 1000
	elif(door == 3):
		get_tree().change_scene("res://Scenes/Bathroom1.tscn")
		Player.position.x = 950
		Player.position.y = 1000
		Player.show()
		Mom.hide()
		Mom.isEnabled = false;
	
func _on_loadScene():
	pass
	
func _on_enterScene():
	pass


func _on_Door3_pressed():
	if(int(Player.position.x) < 1600 and int(Player.position.x) > 750):
		Player.doorPlay()
		door = 3
		Mom.hide()
		Mom.isEnabled = false;
		$Transition_Scene.transition()
	pass # Replace with function body.
