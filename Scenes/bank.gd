extends MarginContainer

@export var starting_gold := 150

@onready var label: Label = $Label

var gold: int:
	set(gold_in):
		gold = 0 if gold + gold_in < 0 else gold + gold_in
		set_label()
		
func _ready() -> void:
	gold = starting_gold

func set_label() -> void:
	label.text = "Gold: %s" % gold
