extends CharacterBody2D
class_name Enemy

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var hurt_box: CollisionShape2D = $HurtBox
@onready var attack_timer: Timer = $AttackTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var graphic: Node2D = $Graphic

@export var hitpoints := 5.0
@export var speed := 200
@export var attack_rate := .5
@export var damage := 1

var player
var player_attackable := false


func _ready() -> void:
	attack_timer.wait_time = attack_rate
	player = get_tree().get_first_node_in_group("Player") as CharacterBody2D


func _physics_process(delta: float) -> void:
	player = get_tree().get_first_node_in_group("Player") as CharacterBody2D

	if !player_attackable:
		velocity = position.direction_to(player.position) * speed
	else:
		velocity = Vector2.ZERO
	
	set_sprite_direction()
	
	if velocity != Vector2.ZERO:
		animation_player.play("walk")
	
	move_and_slide()


func hurt_player() -> void:
	player.take_damage(damage)
	check_if_alive()


func check_if_alive() -> void:
	if hitpoints <= 0:
		die()


func die() -> void:
	queue_free()


func take_damage(damage: float) -> void:
	hitpoints -= damage
	


func _on_attack_timer_timeout() -> void:
	animation_player.play("attack")


func _on_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_attackable = true
		attack_timer.start()


func _on_max_range_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_attackable = false
		attack_timer.stop()
		attack_timer.wait_time = attack_rate


func set_sprite_direction() -> void:
	if player.position.x > position.x:
		graphic.scale.x = 1
	else:
		graphic.scale.x = -1
