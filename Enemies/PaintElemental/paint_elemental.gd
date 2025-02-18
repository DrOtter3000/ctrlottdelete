extends Enemy


@export var Projectile :PackedScene


func fire() -> void:
	var projectile_instance = Projectile.instantiate()
	get_parent().add_child(projectile_instance)
	projectile_instance.global_position = global_position
