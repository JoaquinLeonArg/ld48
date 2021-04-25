extends Node2D

export(Array, PackedScene) var items = []
var item = null
var t = 0

func _ready():
	var index = randi() % len(self.items)
	self.item = self.items[index].instance()
	self.texture = self.item.texture

func _process(delta):
	self.t += delta
	if self.position.distance_to(GameState.player.position) < 32:
		$Hint.visible = true
	else:
		$Hint.visible = false
		
	$Hint.scale = Vector2(0.85 + 0.2*sin(self.t*3), 0.85 + 0.2*sin(self.t*3))
		
	if Input.is_key_pressed(KEY_E) and self.position.distance_to(GameState.player.position) < 32:
		GameState.inventory.pickup(self.item)
		queue_free()
