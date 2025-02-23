extends CanvasLayer

@onready var lbl_door_open: Label = $CenterContainer/LblDoorOpen
@onready var pencil: TextureRect = $MarginContainer/LifeBar/Pencil
@onready var pencil_2: TextureRect = $MarginContainer/LifeBar/Pencil2
@onready var pencil_3: TextureRect = $MarginContainer/LifeBar/Pencil3
@onready var pencil_4: TextureRect = $MarginContainer/LifeBar/Pencil4
@onready var pencil_5: TextureRect = $MarginContainer/LifeBar/Pencil5
@onready var pencil_6: TextureRect = $MarginContainer/LifeBar/Pencil6
@onready var pencil_7: TextureRect = $MarginContainer/LifeBar/Pencil7
@onready var pencil_8: TextureRect = $MarginContainer/LifeBar/Pencil8
@onready var pencil_9: TextureRect = $MarginContainer/LifeBar/Pencil9
@onready var pencil_10: TextureRect = $MarginContainer/LifeBar/Pencil10


func update_lifebar() -> void:
	if Gamestate.hitpoints < 10:
		pencil_10.texture = load("res://Player/Pencil_broken.png")
	if Gamestate.hitpoints < 9:
		pencil_9.texture = load("res://Player/Pencil_broken.png")
	if Gamestate.hitpoints < 8:
		pencil_8.texture = load("res://Player/Pencil_broken.png")
	if Gamestate.hitpoints < 7:
		pencil_7.texture = load("res://Player/Pencil_broken.png")
	if Gamestate.hitpoints < 6:
		pencil_6.texture = load("res://Player/Pencil_broken.png")
	if Gamestate.hitpoints < 5:
		pencil_5.texture = load("res://Player/Pencil_broken.png")
	if Gamestate.hitpoints < 4:
		pencil_4.texture = load("res://Player/Pencil_broken.png")
	if Gamestate.hitpoints < 3:
		pencil_3.texture = load("res://Player/Pencil_broken.png")
	if Gamestate.hitpoints < 2:
		pencil_2.texture = load("res://Player/Pencil_broken.png")
	if Gamestate.hitpoints < 1:
		pencil.texture = load("res://Player/Pencil_broken.png")


func show_open_text() -> void:
	lbl_door_open.visible = true
