extends Area2D

export(bool) var locked = false

var clickable = false
var hovering = false

func _ready():
	$DoorSprite/Hint.rotation_degrees = -self.rotation_degrees

func _on_Door_body_entered(body):
	if body.collision_layer != 4 and not self.locked:
		self.open()

func _process(delta):
	if self.locked:
		$LockedSprite.visible = true
		$DoorSprite/Hint.hint_text = "Locked"
	else:
		$LockedSprite.visible = false
		$DoorSprite/Hint.hint_text = "Open"
	if self.position.distance_to(GameState.player.position) < 32:
		self.clickable = true
		$DoorSprite/Hint.visible = true
	else:
		self.clickable = false
		$DoorSprite/Hint.visible = false
	if Input.is_action_just_pressed("use_item") and self.locked and GameState.inventory.get_current_item() and "KEY" in GameState.inventory.get_current_item().item_flags() and self.hovering:
		self.locked = false
		GameState.inventory.get_current_item().queue_free()
	elif Input.is_action_just_pressed("interact") and self.clickable and not self.locked:
		self.open()

func open():
	$AnimationPlayer.play("Open")


func _on_Door_mouse_entered():
	self.hovering = true


func _on_Door_mouse_exited():
	self.hovering = false
