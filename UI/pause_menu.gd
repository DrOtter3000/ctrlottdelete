extends Control

var paused := false


func switch_visibility() -> void:
	visible = !visible


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause") and paused:
		end_pause()
	if get_tree().paused == true:
		paused = true


func _on_btn_back_pressed() -> void:
	Gamestate.play_button_sound()
	end_pause()

func end_pause() -> void:
	paused = false
	switch_visibility()
	get_tree().paused = false
