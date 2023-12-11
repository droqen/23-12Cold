extends MeshInstance3D

const ROCK_PREFAB = preload("res://00-iso/isotiles/rock.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_viewport_mat(self, $vp)
	var tilemap : TileMap = $vp/Isotilemap/TileMap
	for cell in tilemap.get_used_cells(0):
		match tilemap.get_cell_atlas_coords(0, cell):
			Vector2i(4, 0):
				tilemap.set_cell(0, cell, 0, Vector2i(4, 1))
				var rock = ROCK_PREFAB.instantiate()
				rock.position = black_magic_cell_to_pos(cell)
				get_parent().add_child.call_deferred(rock)
	
func black_magic_cell_to_pos(cell: Vector2i) -> Vector3:
	return Vector3(cell.x * 10 - 45, 0, cell.y * 10 - 45)
	
func _set_viewport_mat(_display_mesh : MeshInstance3D, _sub_viewport : SubViewport, _surface_id : int = 0):
	var _mat : StandardMaterial3D = _display_mesh.get_active_material(0) #StandardMaterial3D.new()
	_mat.albedo_texture = _sub_viewport.get_texture()
	_display_mesh.set_surface_override_material(_surface_id, _mat)
