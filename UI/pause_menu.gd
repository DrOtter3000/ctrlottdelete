extends Control

var paused := false

@onready var sfx_slider: HSlider = $VBoxContainer/SFXContainer/SFXSlider
@onready var music_slider: HSlider = $VBoxContainer/MusicContainer/MusicSlider
@onready var master_slider: HSlider = $VBoxContainer/MasterContainer/MasterSlider


func _ready() -> void:
	master_slider.value_changed.connect(on_audio_slider_changed.bind("Master"))
	sfx_slider.value_changed.connect(on_audio_slider_changed.bind("sfx"))
	music_slider.value_changed.connect(on_audio_slider_changed.bind("music"))
	update_display()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause") and paused:
		end_pause()
	if get_tree().paused == true:
		paused = true


func switch_visibility() -> void:
	visible = !visible
	update_display()


func update_display() -> void:
	sfx_slider.value = get_bus_volume_percent("sfx")
	music_slider.value = get_bus_volume_percent("music")
	master_slider.value = get_bus_volume_percent("Master")


func get_bus_volume_percent(bus_name: String) -> float:
	var bus_index = AudioServer.get_bus_index(bus_name)
	var volume_db = AudioServer.get_bus_volume_db(bus_index)
	return db_to_linear(volume_db)


func set_bus_volume_percent(bus_name: String, percent: float):
	var bus_index = AudioServer.get_bus_index(bus_name)
	var volume_db = linear_to_db(percent)
	AudioServer.set_bus_volume_db(bus_index, volume_db)


func on_audio_slider_changed(value: float, bus_name: String):
	set_bus_volume_percent(bus_name, value)


func _on_btn_back_pressed() -> void:
	Gamestate.play_button_sound()
	end_pause()


func end_pause() -> void:
	paused = false
	switch_visibility()
	get_tree().paused = false
