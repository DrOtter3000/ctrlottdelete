extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var speed := 10
@export var damage := 1

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
	if position.x > 10000 or position.x < -10000:
		queue_free()
	if position.y > 10000 or position.y < -10000:
		queue_free()


func explode() -> void:
	direction = Vector2.ZERO
	animation_player.play("explode")


func _on_body_entered(body: Node2D) -> void:
	explode()


func _on_hurt_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.take_damage(damage)


func play_attack_sound() -> void:
	audio_stream_player_2d.stream = load("res://Audio/SFX/Enemies/projectile_splash.wav")
	audio_stream_player_2d.pitch_scale = randf_range(.7, 1.4)
	audio_stream_player_2d.volume_db = 0
	audio_stream_player_2d.play()
