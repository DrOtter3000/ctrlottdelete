extends Enemy

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func play_walk_sound() -> void:
	audio_stream_player_2d.stream = load("res://Audio/SFX/Enemies/tank_walk.wav")
	audio_stream_player_2d.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player_2d.volume_db = -20
	audio_stream_player_2d.play()


func play_die_sound() -> void:
	audio_stream_player_2d.stream = load("res://Audio/SFX/Enemies/tank_die.wav")
	audio_stream_player_2d.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player_2d.volume_db = 0
	audio_stream_player_2d.play()


func play_attack_sound() -> void:
	audio_stream_player_2d.stream = load("res://Audio/SFX/Enemies/tank_attack.wav")
	audio_stream_player_2d.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player_2d.volume_db = 0
	audio_stream_player_2d.play()
