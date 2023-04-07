extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Viewport Resolution is: ", get_viewport_rect().size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_global_mouse_position()
	#print("Mouse pos:", mouse_pos)
	var player_pos = get_tree().root.get_node("world_root/main_player/player").get_position()
	#print("Player pos:", player_pos)
	
	var vect = get_global_mouse_position() - player_pos
	#print("vect,", vect)
	
	#var angle = atan2(-new_y,new_x)
	var angle = atan2(-vect[1],vect[0])
	
	
	var deg_angle = rad2deg(angle)

	#print("Angle:", deg_angle)
	self.global_rotation_degrees = deg_angle
	
