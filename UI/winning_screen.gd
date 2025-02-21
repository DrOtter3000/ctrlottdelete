extends Control


func _ready() -> void:
	Gamestate.change_music("win")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_btn_menu_pressed() -> void:
	Gamestate.play_button_sound()
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")
