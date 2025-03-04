extends Node

var style: String
var level := 1

var hitpoints := 10
var damage := 0
var speed := 0
var luck := 0
var max_stamina := 10.0


@onready var background_music: AudioStreamPlayer = $BackgroundMusic
@onready var button_sound: AudioStreamPlayer = $ButtonSound

func reset_stats() -> void:
	hitpoints = 10
	damage = 0
	speed = 0
	luck = 0
	level = 1


func play_button_sound() -> void:
	button_sound.pitch_scale = randf_range(.8, 1.2)
	button_sound.play()


func change_music(song: String):
	match song:
		"win":
			background_music.stream = load("res://Audio/Music/Meatball Parade.mp3")
	
	background_music.play()
