extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var pause_menu: Control = $PauseMenu
@onready var attack_pivot: Node2D = $AttackPivot
@onready var attack_spawn_position: Marker2D = $AttackPivot/AttackSpawnPosition

@export var hitpoints := 10
@export var speed := 250
@export var melee_damage := 1.0
@export var melee_attack_scene: PackedScene


func _ready() -> void:
	position = get_tree().get_first_node_in_group("PlayerStartPosition").global_position

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		pause_menu.switch_visibility()
		get_tree().paused = true
	
	if Input.is_action_just_pressed("attack"):
		melee_attack()
	
	attack_pivot.look_at(get_global_mouse_position())


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	var mouse_position = get_global_mouse_position()
	if mouse_position.x > position.x:
		sprite_2d.flip_h = false
	if mouse_position.x < position.x:
		sprite_2d.flip_h = true
	
	move_and_slide()


func take_damage(damage: int) -> void:
	hitpoints -= damage
	check_if_alive()


func check_if_alive():
	if hitpoints <= 0:
		print("game over")


func melee_attack():
	var attack_instance = melee_attack_scene.instantiate()
	get_parent().add_child(attack_instance)
	attack_instance.global_position = attack_spawn_position.global_position
	attack_instance.damage = melee_damage
