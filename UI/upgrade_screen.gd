extends Control

@onready var upgrade_card_template: Control = $UpgradeCardTemplate
@onready var upgrade_card_template_2: Control = $UpgradeCardTemplate2


func _ready() -> void:
	randomize_cards()


func randomize_cards():
	var available_upgrades := ["damage", "speed", "luck"]
	var upgrades_to_choose = available_upgrades.duplicate()
	for i in range(2):
		var card = upgrades_to_choose.pick_random()
		upgrades_to_choose.erase(card)
		if i == 0:
			upgrade_card_template.change_type(card)
		elif i == 1:
			upgrade_card_template_2.change_type(card)
