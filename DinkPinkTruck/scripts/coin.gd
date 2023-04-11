extends Area2D



func _on_coin_body_entered(body):
	if body.is_in_group("player") and $CollisionShape2D.visible == true:
		get_tree().get_root().get_node("world_root/main_player/player").add_points(1)
		queue_free()
