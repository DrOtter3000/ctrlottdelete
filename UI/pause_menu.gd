extends Control



func switch_visibility() -> void:
	visible = !visible


func _on_btn_back_pressed() -> void:
	switch_visibility()
	get_tree().paused = false
