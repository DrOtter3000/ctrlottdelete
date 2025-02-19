extends Node

var style: String

@onready var button_sound: AudioStreamPlayer = $ButtonSound


func play_button_sound() -> void:
	button_sound.pitch_scale = randf_range(.8, 1.2)
	button_sound.play()
