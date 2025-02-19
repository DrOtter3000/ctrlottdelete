extends Area2D

var damage :float


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body.take_damage(damage)


func _on_timer_timeout() -> void:
	queue_free()
