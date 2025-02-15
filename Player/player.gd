extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _ready() -> void:
	position = get_tree().get_first_node_in_group("PlayerStartPosition").global_position


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED

	move_and_slide()
