extends ProgressBar

onready var regen : bool = true
onready var regenPlus : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	value = 100
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if value <= max_value and regen == true and regenPlus == false:
		value += 1.5 * delta
	elif value <= max_value and regen == true and regenPlus == true:
		value += 6 * delta
	pass

func decrease(value):
	if value > 0:
		value -= 1 * value
	pass
