extends Node

var enemies = []
var player = null
var inventory = null
var camera = null
var floor_tiles = []

var destroy_timer = 0

func _process(delta):
	self.destroy_timer += delta
	if self.destroy_timer > 5 and self.floor_tiles:
		self.destroy_timer -= 5
		var i = randi() % len(self.floor_tiles)
		self.floor_tiles[i].spin_and_destroy()
		self.floor_tiles.remove(i)
