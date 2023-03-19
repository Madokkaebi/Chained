extends Control

enum{IDLE, MOVE}

onready var nav2D : Navigation2D = $Navigation2D
onready var line2D : Line2D = $Line2D
onready var Player = get_node("/root/Player/")
onready var Mom = get_node("/root/Mom/")
onready var HUD = get_node("/root/HUD")

var escapeStalker : Vector2 = Vector2 (0 , 1000)


func _input(_delta):
	if (Input.is_action_pressed("ui_rightMouseClick") and Player.isHidden == false):
		var new_path = nav2D.get_simple_path(Player.position, get_global_mouse_position())
		line2D.points = new_path
		#print("Click  " + str(get_global_mouse_position().x) + "  " + str(get_global_mouse_position().y))
		Player.path = new_path
		Player.change_state(MOVE) 

func _process(_delta):
	if(Mom.isEnabled == true and Player.isHidden == false):
		var mom_path = nav2D.get_simple_path(Mom.position, Player.position)
		Mom.path = mom_path
		Mom.set_state(MOVE)
	elif(Mom.isEnabled == true and Player.isHidden == true):
		Mom.isEnabled = false
		var mom_path = nav2D.get_simple_path(Mom.position, escapeStalker)
		Mom.path = mom_path
		Mom.set_state(MOVE)
