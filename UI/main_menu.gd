extends Control

@onready var box_main: VBoxContainer = $BoxMain
@onready var box_options: VBoxContainer = $BoxOptions
@onready var box_credits: HBoxContainer = $BoxCredits


func _ready() -> void:
	box_options.visible = false


func _on_btn_play_pressed() -> void:
	Gamestate.play_button_sound()
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")


func _on_btn_options_pressed() -> void:
	Gamestate.play_button_sound()
	box_main.visible = false
	box_options.visible = true


func _on_btn_quit_pressed() -> void:
	Gamestate.play_button_sound()
	get_tree().quit()


func _on_btn_back_pressed() -> void:
	Gamestate.play_button_sound()
	box_main.visible = true
	box_options.visible = false


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Gamestate.play_button_sound()
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		Gamestate.play_button_sound()
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_btn_credits_pressed() -> void:
	Gamestate.play_button_sound()
	box_credits.visible = true
	box_main.visible = false


func _on_button_pressed() -> void:
	Gamestate.play_button_sound()
	box_main.visible = true
	box_credits.visible = false
