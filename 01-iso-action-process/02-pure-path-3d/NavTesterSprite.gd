extends Node3D

func _process(delta):
	var vel = get_parent().vel
	var camera_pos = get_viewport().get_camera().global_transform.origin
	var flatdir_neutral = Vector3.BACK
	var flatdir_to_camera = camera_pos - global_position
	flatdir_to_camera.y = 0
	
	var screenspace_vel = null
