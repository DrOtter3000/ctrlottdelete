extends Enemy


func set_sprite_direction() -> void:
	if player.position.x > position.x:
		sprite_2d.flip_h = false
	else:
		sprite_2d.flip_h = true
