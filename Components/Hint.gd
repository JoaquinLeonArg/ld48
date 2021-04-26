extends Sprite

var t = 0

func _process(delta):
	self.t += delta
	self.scale = Vector2(0.85 + 0.2*sin(self.t*3), 0.85 + 0.2*sin(self.t*3))
