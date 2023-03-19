extends CanvasLayer

var mode : int = 0

func _ready():
	OS.window_fullscreen = SaveAndLoad.settings.fullscreen
	OS.vsync_enabled = SaveAndLoad.settings.vsync
	_on_SoundSlider_value_changed(SaveAndLoad.settings.volume)
	if(OS.vsync_enabled == true):
		$VSync.set_pressed(true)
	else:
		$VSync.set_pressed(false)
	if(OS.window_fullscreen == true):
		$Fullscreen.set_pressed(true)
	else:
		$Fullscreen.set_pressed(false)
	$SoundSlider.value = SaveAndLoad.settings.volume
	

func showAll():
	$ColorRect.show()
	$SoundSlider.show()
	$VolumeLabel.show()
	$Fullscreen.show()
	$VSync.show()
	$Back.show()

func hideAll():
	$ColorRect.hide()
	$SoundSlider.hide()
	$VolumeLabel.hide()
	$Fullscreen.hide()
	$VSync.hide()
	$Back.hide()

func _on_Fullscreen_toggled(button_pressed):
	ButtonPlay()
	OS.window_fullscreen = button_pressed
	SaveAndLoad.settings.fullscreen = OS.window_fullscreen


func ButtonPlay():
	$ButtonClick.play()


func _on_VSync_toggled(button_pressed):
	ButtonPlay()
	OS.vsync_enabled = button_pressed
	SaveAndLoad.settings.vsync = OS.vsync_enabled


func _on_SoundSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	SaveAndLoad.settings.volume = value


func _on_Back_pressed():
	SaveAndLoad.saveSettings()
	ButtonPlay()
	hideAll()
	if(mode == 0):
		get_tree().paused = false
	else:
		pass
