extends Node

<<<<<<< Updated upstream

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
=======
var player = null
var inventory = null
var floor_tiles = []

var destroy_timer = 0
var damage_factor = 1

func _process(delta):
	self._destroy_floor(delta)

func _destroy_floor(delta):
	self.destroy_timer += delta*self.damage_factor
	if self.destroy_timer > 2 and self.floor_tiles:
		self.destroy_timer -= 2
		var i = randi() % len(self.floor_tiles)
		self.floor_tiles[i].spin_and_destroy()
		self.floor_tiles.remove(i)
>>>>>>> Stashed changes
