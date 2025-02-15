extends Control

@onready var box_main: VBoxContainer = $BoxMain
@onready var box_options: VBoxContainer = $BoxOptions


func _ready() -> void:
	box_options.visible = false


func _on_btn_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")


func _on_btn_options_pressed() -> void:
	box_main.visible = false
	box_options.visible = true


func _on_btn_quit_pressed() -> void:
	get_tree().quit()


func _on_btn_back_pressed() -> void:
	box_main.visible = true
	box_options.visible = false


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
