extends StaticBody2D

@export var wall := true

@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	if !wall:
		var torch_visible := false
		if randi_range(1, 100) < 50:
			torch_visible = true
		$Torch.visible = torch_visible

func update_style(style: String) -> void:
	if wall:
		match style:
			"blank":
				sprite_2d.texture = load("res://Assets/Walls/wall base.png")
			"vines":
				sprite_2d.texture = load("res://Assets/Walls/wall vines.png")
			"cracked":
				sprite_2d.texture = load("res://Assets/Walls/wall cracked.png")
	else:
		match style:
			"blank":
				sprite_2d.texture = load("res://Assets/Pillars/pillar base.png")
			"vines":
				sprite_2d.texture = load("res://Assets/Pillars/pillar vines.png")
			"cracked":
				sprite_2d.texture = load("res://Assets/Pillars/pillar cracked.png")
	
	
