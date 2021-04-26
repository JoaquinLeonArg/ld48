extends Area2D

export(bool) var locked = false

var clickable = false

func _on_Door_body_entered(body):
	if body.collision_layer != 4 and not self.locked:
		self.open()

func _process(delta):
	if self.position.distance_to(GameState.player.position) < 24:
		self.clickable = true
		$DoorSprite/Hint.visible = true
	else:
		self.clickable = false
		$DoorSprite/Hint.visible = false
	if Input.is_action_just_pressed("use_item") and self.locked and GameState.inventory.get_current_item() and "KEY" in GameState.inventory.get_current_item().item_flags():
		self.locked = false
		GameState.inventory.get_current_item().queue_free()
	elif Input.is_action_just_pressed("interact") and self.clickable and not self.locked:
		self.open()

func open():
	$AnimationPlayer.play("Open")
