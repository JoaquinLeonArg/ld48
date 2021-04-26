extends Node2D

export(Array, PackedScene) var items = []
export(int) var static_item = -1
var item = null

func _ready():
	var index
	if self.static_item == -1:
		index = randi() % len(self.items)
	else:
		index = self.static_item
	self.item = self.items[index].instance()
	self.texture = self.item.texture

func _process(delta):
	if self.position.distance_to(GameState.player.position) < 16:
		$Hint.visible = true
	else:
		$Hint.visible = false
		
	if Input.is_action_just_pressed("interact") and self.position.distance_to(GameState.player.position) < 16:
		GameState.inventory.pickup(self.item)
		queue_free()
