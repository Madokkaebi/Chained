extends AnimatedSprite

var isEnabled : bool = false
onready var Player = get_node("/root/Player")

onready var destination = Player.position
var distance = Vector2()
var velocity : Vector2 = Vector2()
var path : PoolVector2Array
export var speed = 375
var direction = 3 				#0 = Back 	1 = Front	2 = Left	3 = Right


enum{IDLE,MOVE}
var state = IDLE


func footsteps():
	if(isEnabled == true):
		if($FS.playing == false):
			$FS.play()
	else:
		$FS.stop()

func _process(delta):
	footsteps()
	var move_distance = speed * delta
#	if(isEnabled == true and Player.position.x != position.x and Player.isHidden == false):
#		set_state(MOVE)
#	else:
#		set_state(IDLE)
#
	match state:
		MOVE:
			move_along_path(move_distance)
		IDLE:
			pass
	
func move_along_path(mdistance):
	#footSteps()
	var starting_point : = position 
	if(Player.isHidden == false):
		if(Player.position.x < starting_point.x ):
			direction = 2
			set_state(MOVE)
		elif(Player.position.x > starting_point.x ):
			direction = 3
			set_state(MOVE)
	else:
		direction = 2
		set_state(MOVE)
		
	
	for _i in range(path.size()): #Por algum motivo, o código não funciona sem o laço "for"
		var distance_to_next : = starting_point.distance_to(path[0])
		
		if (mdistance <= distance_to_next and distance_to_next != 0):
			position = starting_point.linear_interpolate(path[0], mdistance / distance_to_next) 
			break
		
		path.remove(0)
		
		if(path.size() == 0 and isEnabled == true):
			set_state(IDLE)
			get_tree().paused = true
			GameOver.showAll()
		elif(path.size() == 0 and isEnabled == false):
			self.hide()
			print("Fugiu")
	pass


func set_state(newState):
	state = newState
	
	match state:
		IDLE:
			if(direction == 0):
				self.play("Idle_Back")
			elif(direction == 1):
				self.play("Idle_Front")
			elif(direction == 2):
				self.play("Idle_Left")
			elif(direction == 3):
				self.play("Idle_Right")
		MOVE:
			if(direction == 0):
				self.play("Walk_Back")
			elif(direction == 1):
				self.play("Walk_Front")
			elif(direction == 2):
				self.play("Walk_Left")
			elif(direction == 3):
				self.play("Walk_Right")
	
func get_state():
	return state
