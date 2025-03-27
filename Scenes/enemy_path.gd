extends Path3D

@export var enemy_scene: PackedScene
@export var difficulty_manager: DifficultyManager

@onready var timer: Timer = $Timer

func spawn_enemy() -> void:
	var new_enemy = enemy_scene.instantiate()
	add_child(new_enemy)


func _on_timer_timeout() -> void:
	timer.wait_time = difficulty_manager.get_spawn_time()
	spawn_enemy()
