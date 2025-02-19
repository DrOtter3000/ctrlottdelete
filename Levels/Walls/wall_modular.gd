extends StaticBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

func update_style(style: String) -> void:
	match style:
		"blank":
			sprite_2d.texture = load("res://Assets/Walls/wall base.png")
		"vines":
			sprite_2d.texture = load("res://Assets/Walls/wall vines.png")
		"cracked":
			sprite_2d.texture = load("res://Assets/Walls/wall cracked.png")
	
	
