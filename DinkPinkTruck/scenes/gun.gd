extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = get_tree().get_root().get_node("world_root/main_player/player").global_position
	var enemy_pos = self.global_position
	
	var position = enemy_pos - player_pos
	
	var angle = atan2(position[1],position[0])
	
	var deg_angle = rad2deg(angle)

	self.rotation_degrees = deg_angle
	
	if deg_angle > 90 or deg_angle < -90:
		$Sprite.flip_v = true
	else:
		$Sprite.flip_h = true
		$Sprite.flip_v = false

