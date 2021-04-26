extends Node

var player = null
var inventory = null
var camera = null
var floor_tiles = []

var destroy_timer = 0
var restarting = false
var fall_speed = 9999
var damage = 0

func _process(delta):
	if self.restarting:
		return
	self.destroy_timer += delta
	if (self.destroy_timer > self.fall_speed or self.damage > 0) and self.floor_tiles:
		self.destroy_timer = 0
		var i = randi() % len(self.floor_tiles)
		self.floor_tiles[i].spin_and_destroy()
		self.floor_tiles.remove(i)
		while self.damage > 0 and self.floor_tiles:
			i = randi() % len(self.floor_tiles)
			self.floor_tiles[i].spin_and_destroy()
			self.floor_tiles.remove(i)
			if self.damage > 0:
				self.damage -= 1

func restart():
	self.restarting = false
	self.floor_tiles = []
	self.fall_speed = 9999
	self.damage = 0
	get_tree().reload_current_scene()
	
func change_level(level):
	self.restarting = false
	self.floor_tiles = []
	self.fall_speed = 9999
	self.damage = 0
	get_tree().change_scene_to(level)
