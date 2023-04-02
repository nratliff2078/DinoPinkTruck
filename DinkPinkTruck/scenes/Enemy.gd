extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var my_random_number = 1
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	my_random_number = 2
	time += delta
	if time >= 2:
		my_random_number = 1
		time = 0
		
	if my_random_number == 1:
		apply_impulse(Vector2(0,0), Vector2(0,-2 * delta))
	if my_random_number == 2:
		apply_impulse(Vector2(0,0), Vector2(0,2 * delta))

	print(my_random_number)
