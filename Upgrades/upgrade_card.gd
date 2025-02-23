extends Control

var selected = false
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var lbl_name: Label = $MarginContainer/HBoxContainer/NameContainer/MarginContainer/LblName
@onready var lbl_description: Label = $MarginContainer/HBoxContainer/NameContainer/DescriptionContainer/ColorRect/MarginContainer/VBoxContainer/LblDescription

var damage := 0
var speed := 0
var luck := 0


func _process(delta: float) -> void:
	if selected and Input.is_action_just_pressed("attack"):
		Gamestate.damage += damage
		Gamestate.speed += speed
		Gamestate.luck += luck
		animation_player.play("choose")


func _on_mouse_entered() -> void:
	animation_player.play("hover")
	selected = true


func _on_mouse_exited() -> void:
	animation_player.play("release")
	selected = false


func play_hover() -> void:
	audio_stream_player.stream = load("res://Audio/SFX/UI/tick_002.ogg")
	audio_stream_player.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player.play()


func play_choose() -> void:
	audio_stream_player.stream = load("res://Audio/SFX/UI/tick_004.ogg")
	audio_stream_player.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player.play()


func next_level() -> void:
	get_tree().change_scene_to_file("res://Levels/level_template.tscn")


func change_type(type: String) -> void: 
	match type:
		"damage":
			lbl_name.text = "Upgrade Damage"
			lbl_description.text = "Shrubb! Shrubb! Shrubb! Get a stronger eraser! \n \n +10% Damage"
			damage += 1
		"speed":
			lbl_name.text = "Upgrade Speed"
			lbl_description.text = "Did't skip leg day. Now you are faster! \n \n +10% Speed"
			speed += 1
		"luck":
			lbl_name.text = "More Luck"
			lbl_description.text = "Oh look, a penny! \n \n +10% Luck"
			luck += 1
