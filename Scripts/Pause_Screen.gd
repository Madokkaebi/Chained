extends Sprite

onready var Camera = get_node("/root/Player/Camera2D")

func showAll():
	self.show()
	$Overlay.show()
	$CanvasLayer/Resume.show()
	$CanvasLayer/Options.show()
	$CanvasLayer/Reload.show()
	$CanvasLayer/Return.show()
	$CanvasLayer/Resume2.show()

func hideAll():
	self.hide()
	$Overlay.hide()
	$CanvasLayer/Resume.hide()
	$CanvasLayer/Options.hide()
	$CanvasLayer/Reload.hide()
	$CanvasLayer/Return.hide()
	$CanvasLayer/Resume2.hide()

func _on_Resume_pressed():
	hideAll()
	get_tree().paused = false
	$ButtonClick.play()
	pass


func _on_Options_pressed():
	$ButtonClick.play()
	Options.showAll()
	Options.mode = 1
	pass # Replace with function body.


func _on_Reload_pressed():
	$ButtonClick.play()
	hideAll()
	get_tree().paused = false
	MainMenu.option = 2
	MainMenu._on_Transition_Scene_transitioned()
	Player.show()
	TextBox.close()


func _on_Return_pressed():
	$ButtonClick.play()
	hideAll()
	#Camera.current = false
	get_tree().paused = false
	$Transition_Scene.transition()
	Player.songStop()


func _on_Transition_Scene_transitioned():
	# warning-ignore:return_value_discarded
	hideAll()
	#Camera.current = false
	Camera.zoom = Vector2(1, 1)
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")


func _on_Resume2_pressed():
	_on_Resume_pressed()
	pass # Replace with function body.
