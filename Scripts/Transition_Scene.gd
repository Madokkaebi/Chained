extends CanvasLayer

signal transitioned

onready var Player = get_node("/root/Player/")

func transition():
	$AnimationPlayer.play("Fade_to_Black")

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "Fade_to_Black"):
		Player.hide()
		emit_signal("transitioned")
		$AnimationPlayer.play("Fade_to_Normal")
		
	if(anim_name == "Fade_to_Normal"):
		pass
