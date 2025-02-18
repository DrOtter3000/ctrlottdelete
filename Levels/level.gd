extends Node2D

@onready var ground: TextureRect = $Ground

var floor_modulators := [Color.WHITE, Color.BEIGE, Color.BURLYWOOD, Color.DIM_GRAY]

func _ready() -> void:
	var modulator = floor_modulators.pick_random() as Color
	ground.modulate = modulator
