extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var angle = 90
var bullet_speed = 100
onready var bullet = preload("res://scenes/player_bullet.tscn")
# Called when the node enters the scene tree for the first time.
#func _ready():
#	print("Viewport Resolution is: ", get_viewport_rect().size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("gun_up"):
		angle -= 0.1
	
	if Input.is_action_pressed("gun_down"):
		angle += 0.1
		
	var deg_angle = rad2deg(angle)

	#print("Angle:", deg_angle)
	self.global_rotation_degrees = deg_angle

	var gun_angle = angle
	
	
	if Input.is_action_pressed("space"):
		var bullet_instance = bullet.instance()
		bullet_instance.position = get_tree().get_root().get_node("world_root/main_player/player").global_position
		bullet_instance.rotation_degrees = gun_angle
		bullet_instance.apply_impulse(Vector2(), Vector2(-bullet_speed, 0))
		get_tree().get_root().add_child(bullet_instance)
		
