extends Node3D

@export var max_health: int = 5 
@onready var label: Label3D = $Label3D

var health: int:
	set(val):
		health = val
		label.text = str(health)
		if health <= 0:
			get_tree().reload_current_scene()

func _ready() -> void:
	health = max_health

func take_damage() -> void:
	print("hit!")
	health -= 1
