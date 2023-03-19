extends CanvasLayer

onready var Camera = get_node("/root/Player/Camera2D")

func hideAll():
	$ColorRect.hide()
	$GameOver.hide()
	$Reload.hide()
	$Menu.hide()
	$Music.stop()
	
func showAll():
	Player.songStop()
	$ColorRect.show()
	$GameOver.show()
	$Reload.show()
	$Menu.show()
	$Music.play();


func _on_Reload_pressed():
	$ButtonClick.play()
	hideAll()
	get_tree().paused = false
	MainMenu.option = 2
	MainMenu._on_Transition_Scene_transitioned()
	SaveAndLoad.temporary_scenesData = SaveAndLoad.scenesData
	Player.show()
	Mom.hide()
	Mom.isEnabled = false


func _on_Menu_pressed():
	$ButtonClick.play()
	hideAll()
	get_tree().paused = false
	Mom.hide()
	Mom.isEnabled = false
	$Transition_Scene.transition()


func _on_Transition_Scene_transitioned():
	hideAll()
	Camera.zoom = Vector2( 1, 1 )
	get_tree().change_scene("res://Scenes/Main_Menu.tscn")
