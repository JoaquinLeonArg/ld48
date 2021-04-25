extends Control
class_name Item

export(int) var max_uses = 3
var uses = 0

func on_use():
	pass
	
func _process(delta):
	if GameState.inventory.get_current_item() == self:
		self.process_hold(delta)
	elif self in GameState.inventory.get_all_items():
		self.process_in_inventory(delta)

func process_durability():
	self.uses += 1
	if self.uses == self.max_uses:
		queue_free()

func process_hold(_delta):
	pass

func process_in_inventory(_delta):
	pass
