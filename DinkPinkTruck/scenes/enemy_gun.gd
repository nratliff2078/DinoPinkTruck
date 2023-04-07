extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "tex

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = get_tree().get_root().get_node("world_root/main_player/player").get_position()
	var enemy_pos = get_tree().get_root().get_node("world_root/Enemy").get_position()
	var mouse_pos = get_global_mouse_position()
	
	var position = enemy_pos - player_pos
	
	var angle = atan2(-position[1],position[0])
	
	var deg_angle = rad2deg(int(angle))
	
	print("DEG", deg_angle)
	self.rect_rotation = deg_angle
	
	
