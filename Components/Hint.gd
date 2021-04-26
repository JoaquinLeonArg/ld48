extends Node2D

var t = 0
export(float) var scale_factor = 0.85
export(String) var hint_text = "Pickup"

func _ready():
	$Text.bbcode_text = "[center]E:" + self.hint_text + "[/center]"

func _process(delta):
	self.t += delta
	$Sprite.scale = Vector2(self.scale_factor + 0.2*sin(self.t*3), self.scale_factor + 0.2*sin(self.t*3))
