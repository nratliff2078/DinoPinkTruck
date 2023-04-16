extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0
var bullet_speed = 100
export var health = 100
export var maxhealth = 100

onready var bullet = preload("res://scenes/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = get_tree().get_root().get_node("world_root/main_player/player").global_position
	var enemy_pos = self.position
	
	var difference = player_pos - enemy_pos
	
	var distance = pow((pow(difference[0], 2) + pow(difference[1], 2)), 0.5)
	
	if distance < 300:
		time += delta
		if time >= 0.0001:
			var bullet_instance = bullet.instance()
			bullet_instance.position = $Area2D/Position2D.global_position
			bullet_instance.rotation_degrees = $Area2D.rotation_degrees
			bullet_instance.apply_impulse(Vector2(), Vector2(-bullet_speed, 0).rotated($Area2D.rotation))
			get_tree().get_root().add_child(bullet_instance)
			time = 0
		
func _on_Area2D_body_entered(body):
	if body.has_method("hit"):
		body.hit()


