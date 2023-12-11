@tool
extends Node3D

@export var yaw : float = 45
@export var pitch : float = -25
@export var view_size : float = 4
@export var current : bool = false

@onready var _yaw_node : Node3D = $yaw
@onready var _pitch_node : Node3D = $yaw/pitch
@onready var _cam_node : Camera3D = $yaw/pitch/cam

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_yaw_node.rotation = Vector3(0, deg_to_rad(yaw), 0)
	_pitch_node.rotation = Vector3(deg_to_rad(pitch), 0, 0)
	_cam_node.size = view_size
	_cam_node.current = current
