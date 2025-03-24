class_name TurretManager
extends Node3D

@export var turret: PackedScene

func build_turret(turret_pos: Vector3) -> void:
	var new_turret: Node3D = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = turret_pos
