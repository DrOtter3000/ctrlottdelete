extends Enemy


@export var Projectile :PackedScene
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func fire() -> void:
	var projectile_instance = Projectile.instantiate()
	get_parent().add_child(projectile_instance)
	projectile_instance.global_position = global_position


func play_die_sound() -> void:
	audio_stream_player_2d.stream = load("res://Audio/SFX/Enemies/range_die.wav")
	audio_stream_player_2d.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player_2d.volume_db = 0
	audio_stream_player_2d.play()


func play_attack_sound() -> void:
	audio_stream_player_2d.stream = load("res://Audio/SFX/Enemies/range_attack.wav")
	audio_stream_player_2d.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player_2d.volume_db = 0
	audio_stream_player_2d.play()
