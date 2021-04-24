extends Sprite
class_name Item

export(int) var max_uses = 3
var uses = 0

func on_use():
	pass

func process_durability():
	self.uses += 1
	if self.uses == self.max_uses:
		queue_free()
