extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0
var bullet_speed = 100
onready var bullet = preload("res://scenes/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time >= 0.001:
		var bullet_instance = bullet.instance()
		bullet_instance.position = $Area2D/Position2D.global_position
		bullet_instance.rotation_degrees = $Area2D.rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(-bullet_speed, 0).rotated($Area2D.rotation))
		get_tree().get_root().add_child(bullet_instance)
		time = 0
		
