extends Area2D

var spinning: bool = false
onready var base_position: Vector2 = $Sprite.position
	
func _ready():
	yield(get_tree().create_timer(5), "timeout")
	self.spin_and_destroy()
	
func _process(delta):
	if self.spinning:
		$Sprite.position = self.base_position + Vector2(randf()*5 - 1, randf()*5 - 1)
	
func spin_and_destroy():
	self.spinning = true
	yield(get_tree().create_timer(2), "timeout")
	queue_free()
