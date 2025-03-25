class_name TurretManager
extends Node3D

@export var turret: PackedScene
@export var enemy_path: Path3D

func build_turret(turret_pos: Vector3) -> void:
	var new_turret: Turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = turret_pos
	new_turret.set_enemy_path(enemy_path)
