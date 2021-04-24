extends Area2D

var spinning: bool = false
onready var base_position: Vector2 = $Sprite.position
	
func _process(delta):
	if self.spinning:
		$Sprite.position = self.base_position + Vector2(randf()*2 - 1, randf()*2 - 1)
	
func spin_and_destroy():
	self.spinning = true
	yield(get_tree().create_timer(2), "timeout")
	queue_free()
