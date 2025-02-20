extends Node

var style: String
var level := 1

@onready var background_music: AudioStreamPlayer = $BackgroundMusic
@onready var button_sound: AudioStreamPlayer = $ButtonSound


func play_button_sound() -> void:
	button_sound.pitch_scale = randf_range(.8, 1.2)
	button_sound.play()


func change_music(song: String):
	match song:
		"win":
			background_music.stream = load("res://Audio/Music/Meatball Parade.mp3")
	
	background_music.play()
