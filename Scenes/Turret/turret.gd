class_name Turret
extends Node3D

@export var projectile: PackedScene
@export var turrent_range := 10.0

@onready var turret_base: Node3D = $TurretBase
@onready var turret_top: Node3D = $TurretBase/TurretTop
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var cannon: Node3D = $TurretBase/TurretTop/Cannon

var enemy_path: Path3D
var target: PathFollow3D

func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target:
		turret_base.look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target:
		shoot()

func recoil() -> void:
	anim_player.play("fire")

func shoot() -> void:
		var shot: Projectile = projectile.instantiate()
		add_child(shot)
		shot.global_position = cannon.global_position
		shot.direction = turret_base.global_transform.basis.z
		recoil()

func set_enemy_path(path: Path3D) -> void:
	enemy_path = path

func find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress = 0
	for enemy in enemy_path.get_children():
		if (enemy is PathFollow3D &&
		global_position.distance_to(enemy.global_position) < turrent_range &&
		enemy.progress > best_progress):
			best_target = enemy
			best_progress = enemy.progress
	return best_target
