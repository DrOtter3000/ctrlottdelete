extends Node2D

@onready var ground: TextureRect = $Ground

var floor_modulators := [Color.WHITE, Color.BEIGE, Color.BURLYWOOD, Color.DIM_GRAY]
var available_styles = ["blank", "vines", "cracked"]
var style :String


func generate_level() -> void:
	style = available_styles.pick_random()
	get_tree().call_group("Walls", "update_style", style)
	var modulator = floor_modulators.pick_random() as Color
	ground.modulate = modulator


func _on_level_generation_timer_timeout() -> void:
	generate_level()
