extends Node3D

@export var max_health: int = 5 
@onready var label: Label3D = $Label3D

var RED: Color = Color.RED
var WHITE: Color = Color.WHITE

var health: int:
	set(val):
		health = val
		label.text = str(health) + "/" + str(max_health)
		label.modulate = RED.lerp(WHITE, float(health) / float(max_health))
		if health <= 0:
			get_tree().reload_current_scene()

func _ready() -> void:
	health = max_health

func take_damage() -> void:
	health -= 1

func is_unscathed() -> bool:
	return max_health == health
