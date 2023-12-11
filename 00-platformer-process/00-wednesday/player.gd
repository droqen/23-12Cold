extends CharacterBody2D

@onready var pin = $Pin
@onready var spr = $SheetSprite
@onready var shot_prefab = preload("res://00-wednesday/shot.tscn")

func _physics_process(_delta):
	pin.process_pins()
	
	# instant feedback on buttonpress
	if pin.stick.x:
		spr.flip_h = pin.stick.x < 0

	if pin.a.pressed:
		velocity.y = -55
		
	if pin.b.pressed:
		var shot = shot_prefab.instantiate()
		get_parent().add_child(shot)
		var dir : Vector2i = Vector2i.RIGHT
		if spr.flip_h: dir.x = -1
		shot.init_shot(self, dir)
	
	velocity.x = move_toward(velocity.x, pin.stick.x * 30.0, 3.0)
	velocity.y += 1.0
	
	if abs(velocity.x) > 0:
		$SheetSprite.setup([4,3,4,3], 10)
	else:
		$SheetSprite.setup([2])
	
	move_and_slide()
	
	
