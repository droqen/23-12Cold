extends Node2D

@onready var nav : NavigationAgent2D = $NavigationAgent2D

var velocity : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	nav.target_position = Vector2(9, 140)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var npp = nav.get_next_path_position()
	
	velocity = lerp(velocity, (npp - position).normalized() * 100, 0.05)
	position += velocity * delta
	nav.debug_enabled = true
