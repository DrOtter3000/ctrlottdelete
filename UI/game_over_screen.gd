extends Control


func _on_btn_menue_pressed() -> void:
	Gamestate.play_button_sound()
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_btn_restart_pressed() -> void:
	Gamestate.play_button_sound()
	#TODO: add link to game
