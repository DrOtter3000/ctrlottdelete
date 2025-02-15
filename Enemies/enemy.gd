extends CharacterBody2D

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var hurt_box: CollisionShape2D = $HurtBox
@onready var attack_timer: Timer = $AttackTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var hitpoints := 5.0
@export var speed := 200
@export var attack_rate := .5
@export var melee := true

var player
var player_attackable := false


func _ready() -> void:
	attack_timer.wait_time = attack_rate
	player = get_tree().get_first_node_in_group("Player") as CharacterBody2D


func _physics_process(delta: float) -> void:
	player = get_tree().get_first_node_in_group("Player") as CharacterBody2D
	
	if melee:
		velocity = position.direction_to(player.position) * speed
	
	set_sprite_direction()
	
	move_and_slide()


func _on_attack_timer_timeout() -> void:
	animation_player.play("attack")


func _on_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		attack_timer.start()


func _on_max_range_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		attack_timer.stop()
		attack_timer.wait_time = attack_rate


func set_sprite_direction() -> void:
	if player.position.x > position.x:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false
