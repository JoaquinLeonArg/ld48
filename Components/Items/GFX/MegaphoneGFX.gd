extends Sprite

func _process(delta):
	self.scale += Vector2(delta, delta)*5
	self.self_modulate.a -= delta*1.4
	if self.scale.length() > 5:
		queue_free()
