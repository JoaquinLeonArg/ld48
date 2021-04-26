extends Item

func item_flags():
	return ["KEY"]
	
func on_use():
	self.uses = 0
