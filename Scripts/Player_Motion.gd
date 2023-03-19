extends AnimatedSprite


var destination = Vector2()
var distance = Vector2()
var velocity : Vector2 = Vector2()
var direction = 0 				#0 = Back 	1 = Front	2 = Left	3 = Right

var ink = 0;

export var speed = 350

var path : PoolVector2Array

func _ready():
	destination = Vector2(position.x, position.y)


enum{IDLE, MOVE, CLIMB, INTERACT, TURN}

var state = IDLE

func _process(delta):
	var move_distance = speed * delta
	
	match state:
		IDLE:
			pass
		MOVE:
			move_along_path(move_distance)
	pass

func move_along_path(mdistance):
	var starting_point : = position 
	
	if(path[0].x < starting_point.x ):
		direction = 2
		change_state(MOVE)
	elif(path[0].x > starting_point.x ):
		direction = 3
		change_state(MOVE)
	elif(path[0].x - starting_point.x <= 30 and path[0].y < starting_point.y):
		direction = 1
		change_state(MOVE)
	elif(path[0].x - starting_point.x <= 30 and path[0].y >= starting_point.y):
		direction = 0
		change_state(MOVE)
	
	for i in range(path.size()):
		var distance_to_next : = starting_point.distance_to(path[0])
		
		if (mdistance <= distance_to_next and distance_to_next != 0):
			position = starting_point.linear_interpolate(path[0], mdistance / distance_to_next) 
			break
		
		path.remove(0)
		
		if(path.size() == 0):
			change_state(IDLE)
	pass

func change_state(newState):
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

	pass
