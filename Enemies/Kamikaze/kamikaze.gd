extends Enemy


func _on_explosion_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player.take_damage(damage)
