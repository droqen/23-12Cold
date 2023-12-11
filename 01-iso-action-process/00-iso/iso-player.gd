extends CharacterBody3D


const SPEED = 50.0
const JUMP_VELOCITY = 40.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 90.0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (
		transform.basis * Vector3(input_dir.x, 0, input_dir.y)
	).normalized().rotated(Vector3.UP, PI * 0.25)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if input_dir.x: $SheetSprite3D.flip_h = input_dir.x > 0
	
	if not is_on_floor(): $SheetSprite3D.setup([3])
	elif input_dir:
		if len($SheetSprite3D._frames)==1: match $SheetSprite3D._frames[0]:
			2: $SheetSprite3D.setup([3, 2], 8)
			3: $SheetSprite3D.setup([2, 3], 8)
	else: $SheetSprite3D.setup([2])
	
	move_and_slide()
