extends Camera3D

@export var grid_map: GridMap
@export var turret_manager: TurretManager
@export var turret_cost := 100

@onready var ray_cast_3d: RayCast3D = $RayCast3D
@onready var bank = get_tree().get_first_node_in_group("bank")

func _process(delta: float) -> void:
	var mouse_pos: Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_pos) * 100.0
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding() && bank.gold >= turret_cost:
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
			Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
			if Input.is_action_pressed("click"):
				var collision_pt = ray_cast_3d.get_collision_point()
				var cell = grid_map.local_to_map(collision_pt)
				if grid_map.get_cell_item(cell) == 0:
					grid_map.set_cell_item(cell, 1)
					var tile_pos = grid_map.map_to_local(cell)
					turret_manager.build_turret(tile_pos)
					Input.set_default_cursor_shape(Input.CURSOR_ARROW)
					bank.gold -= turret_cost
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
