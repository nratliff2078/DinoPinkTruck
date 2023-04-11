extends RigidBody2D


export var move_speed = 25
export var jump_speed = 2000
export var max_health = 200.0
export var health = 200.0
export var points = 0


var game_over = 0

var torque_speed = 2000 # This must be an extremely large number

# apply_impulse(Vector2(move_speed, 0), Vector2(5000,0))
   # This will give the effect similar to a pool stick hitting a pool ball
func _ready():
	get_tree().paused = true
	get_tree().root.get_node("world_root/main_player/main_ui/CanvasLayer").visible = false
	get_tree().root.get_node("world_root/end_screen/CanvasLayer").visible = false

func _process(delta):
		# Vector2(x,y)
		
		#apply_central_impulse creates the "push" affect
		#apply_torque_impulse makes the body rotate	

	if Input.is_action_pressed("right"):
		apply_central_impulse(Vector2(move_speed, 0))
		apply_torque_impulse(torque_speed)

	if Input.is_action_pressed("left"):
		apply_central_impulse(Vector2(-move_speed, 0))
		apply_torque_impulse(-torque_speed)
	if Input.is_action_just_released("up"):
		# must be -jump_speed to account for inverted y
		apply_central_impulse(Vector2(0, -jump_speed))

	if Input.is_action_just_pressed("menu"):
		if game_over == 1: 
			return
		get_tree().root.get_node("world_root/title_screen/CanvasLayer").visible = true
		get_tree().root.get_node("world_root/main_player/main_ui/CanvasLayer").visible = false
		get_tree().paused = true


func change_health(amount):
	health -= amount
	
	var health_bar = get_tree().root.get_node("world_root/main_player/main_ui/CanvasLayer/player_health")
	health_bar.value = (health / max_health) * 100
	if health <= 0:
		print("You have died!")
		game_over = 1
		get_tree().paused = true
		get_tree().root.get_node("world_root/end_screen/CanvasLayer").visible = true
		get_tree().root.get_node("world_root/main_player/main_ui/CanvasLayer/player_health").visible = false

func add_points(amount):
	points += amount
	get_tree().root.get_node("world_root/main_player/main_ui/CanvasLayer/score_count").text = str(points)
	#var health_bar = get_tree().root.get_node("world_root/main_player/main_ui/CanvasLayer/player_health")
	# Need to update main_ui
		
func _on_Area2D_body_entered(body):
	if body.has_method("hit"):
		body.hit()
