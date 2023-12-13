extends Node3D

@onready var nav : NavigationAgent3D = $NavigationAgent3D

var vel : Vector3

const movement_speed : float = 4.0

# Called when the node enters the scene tree for the first time.
func _ready():
	nav.target_position = $target/marker.global_position + Vector3.UP*1.5
	#nav.debug_enabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	nav.target_position = $target/marker.global_position + Vector3.UP*1.5
	if nav.is_navigation_finished():
		vel = (nav.get_next_path_position()-position) * 0.1
		position += vel
	else:
		vel = position.direction_to(nav.get_next_path_position()) * delta * movement_speed
		position += vel
		
	#var to_next = nav.get_next_path_position() - global_position
	#if to_next.length_squared() > 0.01:
		#vel = lerp(vel, to_next.normalized()*10, 0.1)
	#else:
		#vel *= 0.9
	#position += vel
