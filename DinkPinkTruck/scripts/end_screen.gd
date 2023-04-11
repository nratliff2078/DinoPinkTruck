extends Control


func _on_new_game_pressed():
	get_tree().reload_current_scene()

func _on_quit_game_pressed():
	get_tree().quit()
