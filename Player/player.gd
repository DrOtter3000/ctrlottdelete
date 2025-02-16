extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var pause_menu: Control = $PauseMenu

const SPEED = 300.0


func _ready() -> void:
	position = get_tree().get_first_node_in_group("PlayerStartPosition").global_position


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		pause_menu.switch_visibility()
		get_tree().paused = true


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	
	var mouse_position = get_global_mouse_position()
	if mouse_position.x > position.x:
		sprite_2d.flip_h = false
	if mouse_position.x < position.x:
		sprite_2d.flip_h = true
	
	move_and_slide()
