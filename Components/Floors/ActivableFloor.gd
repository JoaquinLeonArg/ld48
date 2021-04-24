extends Floor

export(int, 3, 10) var active_time = 5

var flashing = -1

func activate():
	$Sprite.visible = true
	$CollisionShape2D.disabled = false
	yield(get_tree().create_timer(self.active_time - 1), "timeout")
	self.flashing = 0
	yield(get_tree().create_timer(1), "timeout")
	$Sprite.visible = false
	$CollisionShape2D.disabled = true
	self.flashing = -1
	
func _process(_delta):
	if self.flashing >= 0:
		self.flashing += 1
		$Sprite.visible = self.flashing % 3 == 0
	
