extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var my_random_number = 1
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(0,0), Vector2(0,-100))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time >= 100:
		
		time = 0
		
