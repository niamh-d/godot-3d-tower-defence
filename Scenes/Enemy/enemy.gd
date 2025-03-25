class_name Enemy
extends PathFollow3D

@export var speed: float = 2.5
@export var max_health := 5

@onready var base = get_tree().get_first_node_in_group("base")

var current_health: int

func _ready() -> void:
	current_health = max_health

func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio == 1:
		apply_damage()

func apply_damage() -> void:
	base.take_damage()
	set_process(false)

func take_damage() -> void:
	current_health -= 1
	if current_health <= 0:
		queue_free()
