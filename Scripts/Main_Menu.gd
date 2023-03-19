extends Node

onready var Player = get_node("/root/Player")
onready var Camera = get_node("/root/Player/Camera2D")

var option : int = -1

func _ready():
	HUD.hide()
	Player.hide()
	Player.z_index = 1
	SaveAndLoad.reset_data()
	Camera.zoom = Vector2(1, 1)
	Camera.limit_right = 1920
	Camera.limit_left = 0

func _on_NewGame_pressed():
	$Click.play()
	option = 1
	$Transition_Scene.transition()
	
	pass # Replace with function body.

func _on_Continue_pressed():
	$Click.play()
	option = 2
	$Transition_Scene.transition()
	pass # Replace with function body.

func _on_Options_pressed():
	$Click.play()
	get_tree().paused = true
	Options.showAll()
	Options.mode = 0
	pass # Replace with function body.

func _on_Quit_pressed():
	$Click.play()
	get_tree().quit()
	pass # Replace with function body.


func _on_Transition_Scene_transitioned():
	if(option == 1):
		SaveAndLoad.reset_data()
		# warning-ignore:return_value_discarded
		Camera.current = true
		Camera.zoom = Vector2( 0.8, 0.8 )
		get_tree().change_scene("res://Scenes/Charles_Room.tscn")
		Player.position.x = 1450
		Player.position.y = 1000
		Player.show()
		HUD.show()
		TextBox.texts("The young Charles once saw a tiny green light passing through his window's barricades.\nThis lighten up his hope and will to escape his house.")
		pass
	if(option == 2):
		SaveAndLoad.load_game()
		SaveAndLoad.temporary_scenesData = SaveAndLoad.scenesData
		Player.ink = SaveAndLoad.data.player.ink
		# warning-ignore:return_value_discarded
		Camera.current = true
		Camera.zoom = Vector2( 0.8, 0.8 )
		get_tree().change_scene(SaveAndLoad.data.player.current_Scene)
		Player.position.x = SaveAndLoad.data.player.PositionX
		Player.position.y = SaveAndLoad.data.player.PositionY
		Player.play(SaveAndLoad.data.player.pose)
		Player.show()
		HUD.show()
		pass
	pass # Replace with function body.


func _on_Tutorial_pressed():
	$Click.play()
	$Background/Overlay.show()
	pass # Replace with function body.


func _on_Return_pressed():
	$Click.play()
	$Background/Overlay.hide()
	pass # Replace with function body.
