extends Area2D

export var angle = 90
var bullet_speed = 1000
onready var bullet = preload("res://scenes/player_bullet.tscn")

#func _ready():
#	print("Viewport Resolution is: ", get_viewport_rect().size)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# This is how we do gun angle based upon mouse
	
	var player_pos = get_tree().get_root().get_node("world_root/main_player/player").global_position
	var mouse_pos = get_viewport().get_mouse_position()
	var x_diff = mouse_pos[0] - player_pos[0]
	var y_diff = mouse_pos[1] - player_pos[1]
	
	var angle = atan2(-y_diff,x_diff)
	self.global_rotation_degrees = -rad2deg(angle)
	
	#if Input.is_action_pressed("gun_up"):
	#	angle += 10
	
	#if Input.is_action_pressed("gun_down"):
	#	angle -= 10
		
	#var deg_angle = rad2deg(angle)
	var deg_angle = angle
	#self.global_rotation_degrees = deg_angle
	if deg_angle > 90 or deg_angle < -90:
		$Sprite.flip_v = true
	else:
		$Sprite.flip_h = true
		$Sprite.flip_v = false
		
	if Input.is_action_pressed("space"):
		var bullet_instance = bullet.instance()
		bullet_instance.position = get_tree().get_root().get_node("world_root/main_player/player").global_position
		
	#	bullet_instance.rotation_degrees = angle
	#	bullet_instance.global_rotation_degrees = deg_angle
		
		var bullet_angle = -self.global_rotation
		var bullet_dir = Vector2(cos(bullet_angle), -sin(bullet_angle)) * bullet_speed
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_dir[0],bullet_dir[1]))
		get_tree().get_root().add_child(bullet_instance)
		
