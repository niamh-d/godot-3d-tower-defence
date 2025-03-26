extends MarginContainer

@export var starting_gold := 150

@onready var label: Label = $Label

var gold: int:
	set(gold_in):
		gold = max(gold_in, 0)
		set_label()
		
func _ready() -> void:
	gold = starting_gold

func set_label() -> void:
	label.text = "Gold: %s" % gold
