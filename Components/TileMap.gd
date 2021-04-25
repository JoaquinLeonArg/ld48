extends TileMap

export(Array, int) var floor_tiles
var floor_scene = load("res://Components/Floors/Floor.tscn")

func _ready():
	for cell_pos in self.get_used_cells():
		var index = self.get_cellv(cell_pos)
		if index in self.floor_tiles:
			self.set_cellv(cell_pos, -1)
			var f = floor_scene.instance()
			var current_tile_texture = self.tile_set.tile_get_region(index)
			f.get_node("Sprite").texture = self.tile_set.tile_get_texture(index)
			var offset = randi() % int(self.tile_set.tile_get_region(index).size.x / self.cell_size.x)
			f.get_node("Sprite").region_rect = Rect2(self.tile_set.tile_get_region(index).position + Vector2(offset * self.cell_size.x, 0), self.cell_size)
			f.get_node("Sprite").region_enabled = true
			f.position = cell_pos*self.cell_size + self.cell_size/2
			self.add_child(f)
