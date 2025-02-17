extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var speed := 10

var player
var direction = Vector2.ZERO

func _ready() -> void:
	await get_tree().create_timer(.01).timeout
	player = get_tree().get_first_node_in_group("Player")
	direction = position.direction_to(player.position)


func _process(delta: float) -> void:
	position += direction * speed * delta
	check_for_self_destruct()


func check_for_self_destruct() -> void:
	if position.x > 1000 or position.x < -1000:
		queue_free()
	if position.y > 1000 or position.y < -1000:
		queue_free()


func explode() -> void:
	direction = Vector2.ZERO
	animation_player.play("explode")


func _on_body_entered(body: Node2D) -> void:
	explode()
