extends Node2D

var floor_scene = load("res://Components/Floor.tscn")
			
func _ready():
	for x in range(100):
		for y in range(100):
			var f = floor_scene.instance()
			f.position = Vector2(x*16, y*16)
			self.add_child(f)
