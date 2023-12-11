extends Area2D

var _dir : Vector2i
var deleted : bool = false
var corpse_lifetime : int = 16

func init_shot(player:CharacterBody2D, dir:Vector2i):
	position = player.position + Vector2.DOWN * 1.5
	if dir.length_squared() == 1:
		_dir = dir
	else:
		push_error("Invalid shot dir "+str(dir))
		_dir = Vector2i.RIGHT
	position += _dir as Vector2 * 4

func _physics_process(_delta):
	if deleted:
		corpse_lifetime -= 1
		if corpse_lifetime <= 0: queue_free()
	else:
		position += _dir as Vector2 * 2
		for body in get_overlapping_bodies():
			deleted = true
			$SheetSprite.hide()
			$PopAnim.show()
			$PopAnim.set_frame_index(0)
