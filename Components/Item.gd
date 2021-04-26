extends Sprite
class_name Item

export(int) var max_uses = 3
var mouse_hint = null
var uses = 0

func _ready():
	self.mouse_hint = Sprite.new()
	self.mouse_hint.modulate.a = 0.3
	self.add_child(self.mouse_hint)
	self.mouse_hint.texture = self.texture

func item_flags():
	return []

func on_use():
	pass
	
func _process(delta):
	if GameState.inventory.get_current_item() == self:
		self.process_hold(delta)
		self.mouse_hint.visible = true
		self.mouse_hint.global_position = get_global_mouse_position()
	elif self in GameState.inventory.get_all_items():
		self.process_in_inventory(delta)
		self.mouse_hint.visible = false
	else:
		self.mouse_hint.visible = false

func process_durability():
	self.uses += 1
	if self.uses == self.max_uses:
		queue_free()

func process_hold(_delta):
	pass

func process_in_inventory(_delta):
	pass
