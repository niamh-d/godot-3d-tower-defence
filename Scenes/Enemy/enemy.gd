class_name Enemy
extends PathFollow3D

@export var speed: float = 5.0
@export var max_health := 10
@export var gold_dropped := 25

@onready var base = get_tree().get_first_node_in_group("base")
@onready var bank = get_tree().get_first_node_in_group("bank")
@onready var anim_player: AnimationPlayer = $AnimationPlayer

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
	queue_free()
	
func die() -> void:
	queue_free()
	bank.gold += gold_dropped

func take_damage(damage: int) -> void:
	current_health -= damage
	anim_player.play("take_damage")
	if current_health <= 0:
		die()
