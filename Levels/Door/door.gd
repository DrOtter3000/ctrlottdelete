extends Node2D

@onready var door_collision: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var next_level_area: Area2D = $NextLevelArea
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func open() -> void:
	#TODO: add sound effect
	door_collision.disabled = true
	next_level_area.monitoring = true
	audio_stream_player.play()
	get_tree().call_group("HUD", "show_open_text")


func _on_next_level_area_body_entered(body: Node2D) -> void:
	if Gamestate.level == 10:
		get_tree().change_scene_to_file("res://UI/winning_screen.tscn")
	else:
		Gamestate.level += 1
		get_tree().change_scene_to_file("res://UI/upgrade_screen.tscn")
