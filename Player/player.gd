extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var pause_menu: Control = $PauseMenu
@onready var attack_pivot: Node2D = $AttackPivot
@onready var attack_spawn_position: Marker2D = $AttackPivot/AttackSpawnPosition
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@export var speed := 250
@export var melee_damage := 1.0
@export var melee_attack_scene: PackedScene

var final_speed: float
var final_melee_damage: float

var alive := true


func _ready() -> void:
	position = get_tree().get_first_node_in_group("PlayerStartPosition").global_position
	update_lifebar()
	final_speed = speed + (speed * Gamestate.speed / 10)
	final_melee_damage = melee_damage + (melee_damage * Gamestate.damage /10)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		pause_menu.switch_visibility()
		get_tree().paused = true
	
	if Input.is_action_just_pressed("attack"):
		melee_attack()
	
	attack_pivot.look_at(get_global_mouse_position())


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * final_speed
	
	var mouse_position = get_global_mouse_position()
	if mouse_position.x > position.x:
		sprite_2d.flip_h = false
	if mouse_position.x < position.x:
		sprite_2d.flip_h = true
	
	move_and_slide()


func take_damage(damage: int) -> void:
	Gamestate.hitpoints -= damage
	audio_stream_player.play()
	update_lifebar()
	check_if_alive()
	if alive:
		sprite_2d.modulate = Color.RED
		await get_tree().create_timer(.1).timeout
		sprite_2d.modulate = Color.WHITE


func check_if_alive():
	if Gamestate.hitpoints <= 0:
		alive = false
		get_tree().change_scene_to_file("res://UI/game_over_screen.tscn")


func melee_attack():
	var crit_test = randi_range(1, 10)
	if crit_test <= Gamestate.luck:
		final_melee_damage *= 2
	var attack_instance = melee_attack_scene.instantiate()
	get_parent().add_child(attack_instance)
	attack_instance.global_position = attack_spawn_position.global_position
	attack_instance.damage = final_melee_damage 


func update_lifebar():
	get_tree().call_group("HUD", "update_lifebar")
