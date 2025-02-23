extends Node2D

@onready var ground: TextureRect = $Ground
@onready var enemy_positions: Node2D = $Enemies/EnemyPositions
@onready var enemies_on_field: Node2D = $Enemies/EnemiesOnField
@onready var door: Node2D = $Door

var floor_modulators := [Color.WHITE, Color.BEIGE, Color.BURLYWOOD, Color.DIM_GRAY]
var available_styles = ["blank", "vines", "cracked"]
var style :String
var enemies_alive := 0

@export var slime_scene: PackedScene
@export var tank_scene: PackedScene
@export var range_scene: PackedScene
@export var kamikaze_scene: PackedScene


func _ready() -> void:
	select_enemies()

func set_enemy(enemy: String) -> void:
	var enemy_position = enemy_positions.get_children().pick_random()
	var enemy_instance 
	match enemy:
		"slime":
			enemy_instance = slime_scene.instantiate()
		"tank":
			enemy_instance = tank_scene.instantiate()
		"range":
			enemy_instance = range_scene.instantiate()
		"kamikaze":
			enemy_instance = kamikaze_scene.instantiate()
	
	get_node("Enemies/EnemiesOnField").add_child(enemy_instance)
	enemy_instance.global_position = enemy_position.global_position
	enemy_position.queue_free()


func generate_level() -> void:
	style = available_styles.pick_random()
	get_tree().call_group("Walls", "update_style", style)
	var modulator = floor_modulators.pick_random() as Color
	ground.modulate = modulator


func select_enemies() -> void:
	var enemy_list := {"slime": 0, "tanks": 0, "ranges": 0, "kamikazes": 0}
	
	match Gamestate.level:
		1:
			enemy_list = {"slime": 4, "tanks": 0, "ranges": 1, "kamikazes": 1}
		
		2:
			enemy_list = {"slime": 6, "tanks": 1, "ranges": 0, "kamikazes": 0}
		
		3:
			enemy_list = {"slime": 8, "tanks": 1, "ranges": 1, "kamikazes": 0}
		
		4:
			enemy_list = {"slime": 10, "tanks": 2, "ranges": 2, "kamikazes": 0}

		5:
			enemy_list = {"slime": 10, "tanks": 2, "ranges": 2, "kamikazes": 0}
		
		6:
			enemy_list = {"slime": 10, "tanks": 2, "ranges": 3, "kamikazes": 1}
		
		7:
			enemy_list = {"slime": 10, "tanks": 3, "ranges": 3, "kamikazes": 2}
		
		8:
			enemy_list = {"slime": 10, "tanks": 3, "ranges": 4, "kamikazes": 3}
		
		9:
			enemy_list = {"slime": 10, "tanks": 3, "ranges": 4, "kamikazes": 4}
		
		10:
			enemy_list = {"slime": 10, "tanks": 4, "ranges": 5, "kamikazes": 5}
	
	for i in enemy_list["slime"]:
		set_enemy("slime")
		await get_tree().create_timer(.01).timeout 
	for i in enemy_list["tanks"]:
		set_enemy("tank")
		await get_tree().create_timer(.01).timeout
	for i in enemy_list["ranges"]:
		set_enemy("range")
		await get_tree().create_timer(.01).timeout
	for i in enemy_list["kamikazes"]:
		set_enemy("kamikaze")
		await get_tree().create_timer(.01).timeout


func _on_level_generation_timer_timeout() -> void:
	generate_level()


func _on_count_enemies_timer_timeout() -> void:
	if enemies_on_field.get_child_count() == 0:
		door.open()
