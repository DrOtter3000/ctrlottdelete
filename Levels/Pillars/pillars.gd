extends Node2D

@onready var pillar: StaticBody2D = $Pillar
@onready var pillar_2: StaticBody2D = $Pillar2
@onready var pillar_3: StaticBody2D = $Pillar3
@onready var pillar_4: StaticBody2D = $Pillar4
@onready var pillar_5: StaticBody2D = $Pillar5
@onready var pillar_6: StaticBody2D = $Pillar6
@onready var pillar_7: StaticBody2D = $Pillar7
@onready var pillar_8: StaticBody2D = $Pillar8
@onready var pillar_9: StaticBody2D = $Pillar9
@onready var pillar_10: StaticBody2D = $Pillar10
@onready var pillar_11: StaticBody2D = $Pillar11
@onready var pillar_12: StaticBody2D = $Pillar12
@onready var pillar_13: StaticBody2D = $Pillar13
@onready var pillar_14: StaticBody2D = $Pillar14
@onready var pillar_15: StaticBody2D = $Pillar15
@onready var pillar_16: StaticBody2D = $Pillar16
@onready var pillar_17: StaticBody2D = $Pillar17
@onready var pillar_18: StaticBody2D = $Pillar18
@onready var pillar_19: StaticBody2D = $Pillar19
@onready var pillar_20: StaticBody2D = $Pillar20
@onready var pillar_21: StaticBody2D = $Pillar21


func _ready() -> void:
	var muster = randi_range(1,4)
	match muster:
		1:
			pillar.queue_free()
			pillar_2.queue_free()
			pillar_3.queue_free()
			pillar_4.queue_free()
			pillar_5.queue_free()
			pillar_6.queue_free()
			pillar_7.queue_free()
			pillar_8.queue_free()
			pillar_9.queue_free()
			pillar_10.queue_free()
			pillar_11.queue_free()
			pillar_12.queue_free()
			pillar_13.queue_free()
			pillar_14.queue_free()
			pillar_15.queue_free()
			pillar_16.queue_free()
			pillar_17.queue_free()
			pillar_18.queue_free()
			pillar_19.queue_free()
			pillar_20.queue_free()
			pillar_21.queue_free()

		2:
			pillar_8.queue_free()
			pillar_9.queue_free()
			pillar_10.queue_free()
			pillar_11.queue_free()
			pillar_12.queue_free()
			pillar_13.queue_free()
			pillar_14.queue_free()

		3:
			pillar.queue_free()
			pillar_2.queue_free()
			pillar_3.queue_free()
			pillar_4.queue_free()
			pillar_5.queue_free()
			pillar_6.queue_free()
			pillar_7.queue_free()
			pillar_15.queue_free()
			pillar_16.queue_free()
			pillar_17.queue_free()
			pillar_18.queue_free()
			pillar_19.queue_free()
			pillar_20.queue_free()
			pillar_21.queue_free()
		4:
			pillar.queue_free()
			pillar_2.queue_free()
			pillar_3.queue_free()
			pillar_4.queue_free()
			pillar_5.queue_free()
			pillar_6.queue_free()
			pillar_7.queue_free()
			pillar_8.queue_free()
			pillar_10.queue_free()
			pillar_12.queue_free()
			pillar_14.queue_free()
			pillar_15.queue_free()
			pillar_16.queue_free()
			pillar_17.queue_free()
			pillar_18.queue_free()
			pillar_19.queue_free()
			pillar_20.queue_free()
			pillar_21.queue_free()
