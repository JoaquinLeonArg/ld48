extends Area2D

export(float) var timeout = 5
export(Array, NodePath) var targets = []

onready var disabled = false
	
func activate():
	if self.disabled:
		return
	self.disabled = true
	$Sprite.frame_coords = Vector2(1, 0) # Disabled sprite
	for target in self.targets:
		print(target)
		get_node(target).activate()
	yield(get_tree().create_timer(self.timeout), "timeout")
	$Sprite.frame_coords = Vector2(0, 0) # Enabled sprite
	self.disabled = false


func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		self.activate()
