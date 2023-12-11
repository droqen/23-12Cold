extends Node

@export var cam : Camera3D
@export var cursor_obj : Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mouse_screen_point = get_viewport().get_mouse_position()
		var mouse_ray_origin = cam.project_ray_origin(mouse_screen_point)
		var mouse_ray_normal = cam.project_ray_normal(mouse_screen_point)
		$mouse_ray.position = mouse_ray_origin
		$mouse_ray.target_position = mouse_ray_normal * 10000
		$mouse_ray.force_raycast_update()
		if $mouse_ray.is_colliding():
			var hit_pos = $mouse_ray.get_collision_point()
			if cursor_obj:
				cursor_obj.position = hit_pos
			else:
				prints("mouseclicker has unused hit: ",hit_pos)
