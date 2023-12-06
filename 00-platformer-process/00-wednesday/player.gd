extends CharacterBody2D

@onready var pin = $Pin
@onready var spr = $SheetSprite

func _physics_process(_delta):
	pin.process_pins()
	
	# instant feedback on buttonpress
	if pin.stick.x:
		spr.flip_h = pin.stick.x < 0

	if pin.a.pressed:
		velocity.y = -55
	
	velocity.x = move_toward(velocity.x, pin.stick.x * 20.0, 2.0)
	velocity.y += 1.0
	
	if abs(velocity.x) > 0:
		$SheetSprite.setup([4,3,4,3], 10)
	else:
		$SheetSprite.setup([2])
	
	move_and_slide()
	
	
