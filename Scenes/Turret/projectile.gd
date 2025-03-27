class_name Projectile
extends Area3D

@export var speed := 30.0
@export var projectile_damage := 25

var direction := Vector3.FORWARD

func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		area.get_parent().take_damage(projectile_damage)
	queue_free()
