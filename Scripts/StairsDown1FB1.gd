extends Node

onready var Camera = get_node("/root/Player/Camera2D")
onready var Player = get_node("/root/Player")
onready var Mom = get_node("/root/Mom")
onready var HUD = get_node("/root/HUD")
onready var sceneData = SaveAndLoad.scenesData.StairsDown1FB1
onready var temporarysceneData = SaveAndLoad.temporary_scenesData.StairsDown1FB1
onready var TextBox = get_node("/root/TextBox")

var door = -1
var Door2Open = false

func _ready():
	_on_enterScene()
	Player.song(1)
	Player.show()
	HUD.show()
	Player.currentMap = 5
	Camera.limit_right = 1920
	Camera.limit_left = 0
	HUD.connect("itemUse2", self, "openDoor")

func _on_Door_pressed():
	if(int(Player.position.x) < 1290 and int(Player.position.x) > 590):
		Player.doorPlay()
		door = 1
# warning-ignore:return_value_discarded
		$Transition_Scene.transition()
	else:
		TextBox.texts("You're too far.")

func openDoor(object):
	temporarysceneData.door = false
	Door2Open = true
	Player.keyPlay()
	$Control/Environment/Door.hide()
	$Control/Environment/StairsDown.show()
	$Control/Botoes/ClosedDoor.hide()
	$Control/Botoes/StairsDown.show()
	object.clearSlot()
	pass

func _on_Transition_Scene_transitioned():
	# warning-ignore:return_value_discarded
	if(door == 1):
		get_tree().change_scene("res://Scenes/Kitchen.tscn")
		Player.position.x = 1850
		Player.position.y = 1000
		Player.show()
		Mom.show()
		Mom.isEnabled = true;
		Mom.position.x = 2540
		Mom.position.y = 1000
	elif(door == 2):
		get_tree().change_scene("res://Scenes/Pantry.tscn")
		Player.position.x = 270
		Player.position.y = 1000
		Player.show()
		Mom.show()
		Mom.isEnabled = true;
		Mom.position.x = 1800
		Mom.position.y = 1000

func _on_loadScene():
	if(sceneData.door == false):
		$Control/Environment/Door.hide()
		$Control/Environment/StairsDown.show()
		$Control/Botoes/ClosedDoor.hide()
		$Control/Botoes/StairsDown.show()
	pass
	
func _on_enterScene():
	if(temporarysceneData.door == false):
		$Control/Environment/Door.hide()
		$Control/Environment/StairsDown.show()
		$Control/Botoes/ClosedDoor.hide()
		$Control/Botoes/StairsDown.show()
	pass


func _on_ClosedDoor_pressed():
	if(int(Player.position.x) < 1700 and int(Player.position.x) > 400):
		TextBox.texts("The door is locked.")
# warning-ignore:return_value_discarded
	else:
		TextBox.texts("You're too far.")


func _on_StairsDown_pressed():
	if(int(Player.position.x) < 1700 and int(Player.position.x) > 400):
		Player.footStepOnce()
		door = 2
# warning-ignore:return_value_discarded
		$Transition_Scene.transition()
	else:
		TextBox.texts("You're too far.")
