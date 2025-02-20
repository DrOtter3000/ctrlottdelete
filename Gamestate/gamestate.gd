extends Node

var style: String
var level := 1

@onready var button_sound: AudioStreamPlayer = $ButtonSound


func play_button_sound() -> void:
	button_sound.pitch_scale = randf_range(.8, 1.2)
	button_sound.play()


#func select_enemies() -> void:
	#var slimes := 0
	#var tanks := 0
	#var ranges := 0
	#var kamikazes := 0
#
	#match level:
		#1:
			#slimes = 10
			#tanks = 0
			#ranges = 0
			#kamikazes = 0
		#
		#2:
			#slimes = 9
			#tanks = 0
			#ranges = 3
			#kamikazes = 0
		#
		#3:
			#slimes = 9
			#tanks = 1
			#ranges = 3
			#kamikazes = 0
		#
		#4:
			#slimes = 5
			#tanks = 5
			#ranges = 3
			#kamikazes = 2
	#
	#for i in slimes:
		#get_tree().call_group("Level", "set_enemy", "slime")
		#await get_tree().create_timer(.01).timeout 
	#for i in tanks:
		#get_tree().call_group("Level", "set_enemy", "tank")
		#await get_tree().create_timer(.01).timeout
	#for i in ranges:
		#get_tree().call_group("Level", "set_enemy", "range")
		#await get_tree().create_timer(.01).timeout
	#for i in kamikazes:
		#get_tree().call_group("Level", "set_enemy", "kamikaze")
		#await get_tree().create_timer(.01).timeout
