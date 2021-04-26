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
	if GameState.player.position.distance_to(self.position) < 32:
		$Hint.visible = true
		if Input.is_action_just_pressed("interact"):
			self.activate()
	else:
		$Hint.visible = false
