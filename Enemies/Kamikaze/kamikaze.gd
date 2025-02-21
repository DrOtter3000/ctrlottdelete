extends Enemy

@onready var lbl_exposion_text: Label = $LblExposionText
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	lbl_exposion_text.visible = false

func _on_explosion_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player.take_damage(damage)


func play_explosion_sound() -> void:
	audio_stream_player_2d.stream = load("res://Audio/SFX/Enemies/explosion.wav")
	audio_stream_player_2d.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player_2d.volume_db = 0
	audio_stream_player_2d.play()


func play_walk_sound() -> void:
	var sound_array = ["res://Audio/SFX/Enemies/CanWalkSounds/can_walk_1.wav", "res://Audio/SFX/Enemies/CanWalkSounds/can_walk_2.wav", "res://Audio/SFX/Enemies/CanWalkSounds/can_walk_3.wav", "res://Audio/SFX/Enemies/CanWalkSounds/can_walk_4.wav", "res://Audio/SFX/Enemies/CanWalkSounds/can_walk_5.wav", "res://Audio/SFX/Enemies/CanWalkSounds/can_walk_6.wav", "res://Audio/SFX/Enemies/CanWalkSounds/can_walk_7.wav", "res://Audio/SFX/Enemies/CanWalkSounds/can_walk_8.wav"]
	audio_stream_player_2d.stream = load(sound_array.pick_random())
	audio_stream_player_2d.volume_db = -12
	
	audio_stream_player_2d.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player_2d.play()
