extends Enemy


@export var Projectile :PackedScene


func set_sprite_direction() -> void:
	if player.position.x > position.x:
		sprite_2d.flip_h = false
	else:
		sprite_2d.flip_h = true

func fire() -> void:
	var projectile_instance = Projectile.instantiate()
	get_parent().add_child(projectile_instance)
	projectile_instance.global_position = global_position
