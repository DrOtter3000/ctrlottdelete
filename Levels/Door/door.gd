extends Node2D

@onready var door_collision: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var next_level_area: Area2D = $NextLevelArea


func open() -> void:
	door_collision.disabled = true
	next_level_area.monitoring = true


func _on_next_level_area_body_entered(body: Node2D) -> void:
	#TODO: add sound effect
	Gamestate.level += 1
	get_tree().change_scene_to_file("res://Levels/level_template.tscn")
