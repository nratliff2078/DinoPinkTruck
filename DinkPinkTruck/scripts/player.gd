extends RigidBody2D

export var move_speed = 1000
export var jump_speed = 2500

var torque_speed = 8000 # This must be an extremely large number

# apply_impulse(Vector2(move_speed, 0), Vector2(5000,0))
   # This will give the effect similar to a pool stick hitting a pool ball

func _process(delta):
		# Vector2(x,y)
		
		#apply_central_impulse creates the "push" affect
		#apply_torque_impulse makes the body rotate	
		
	if Input.is_action_just_released("right"):
		apply_central_impulse(Vector2(move_speed, 0))
		apply_torque_impulse(torque_speed)
		
	if Input.is_action_just_released("left"):
		apply_central_impulse(Vector2(-move_speed, 0))
		apply_torque_impulse(-torque_speed)
		
	if Input.is_action_just_released("up"):
		# must be -jump_speed to account for inverted y
		apply_central_impulse(Vector2(0, -jump_speed))
