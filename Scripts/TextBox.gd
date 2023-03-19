extends CanvasLayer



var text : String = ""

func _ready():
	$Chat.stop()

func hide():
	$Overlay.hide()
	$Rectangle.hide()
	$TextBot.hide()
	$Click.hide()
	$Screen.hide()
	

func show():
	$Overlay.show()
	$Rectangle.show()
	$TextBot.show()
	$Click.show()
	$Screen.show()


func texts(texto):
	get_tree().paused = true
	show()
	$Screen.show()
	$TextBot.text = texto
	$Timer.start()
	$TextBot.visible_characters = 0

func close():
	get_tree().paused = false
	text = ""
	hide()
	$Screen.hide()
	$Chat.play()
	$Timer.stop()


func _on_Rectangle_pressed():
	close()


func _on_Timer_timeout():
	if($TextBot.get_total_character_count() > $TextBot.visible_characters):
		$TextBot.visible_characters = ($TextBot.visible_characters + 1)
		$Chat.play()
	else:
		$Chat.stop()
	pass # Replace with function body.


func _on_Screen_pressed():
	close()
