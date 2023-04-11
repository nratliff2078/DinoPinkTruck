extends Control


func _ready():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	


func _on_start_pressed():
	get_tree().root.get_node("world_root/title_screen/CanvasLayer").visible = false
	get_tree().paused = false
	get_tree().root.get_node("world_root/title_screen/CanvasLayer/resume").visible = true
	get_tree().root.get_node("world_root/title_screen/CanvasLayer/start").visible = false
	get_tree().root.get_node("world_root/main_player/main_ui/CanvasLayer").visible = true
	
func _on_resume_pressed():
	get_tree().root.get_node("world_root/title_screen/CanvasLayer").visible = false
	get_tree().root.get_node("world_root/main_player/main_ui/CanvasLayer").visible = true
	get_tree().paused = false
