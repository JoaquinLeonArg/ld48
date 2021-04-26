extends Area2D
class_name Floor

var spinning: bool = false
var falling: bool = false
var player_stepping: bool = false
onready var base_position: Vector2 = $Sprite.position

func is_destructible():
	return true

func _ready():
	if self.is_destructible():
		GameState.floor_tiles.append(self)

func _process(delta):
	if self.spinning:
		$Sprite.position = self.base_position + Vector2(randf()*2 - 1, randf()*2 - 1)
	if self.falling:
		self.position.y += delta*10
		self.modulate.a -= delta*0.5

func spin_and_destroy():
	self.spinning = true
	yield(get_tree().create_timer(2), "timeout")
	self.falling = true
	self.spinning = false
	$CollisionShape2D.disabled = true
	yield(get_tree().create_timer(1), "timeout")
	queue_free()

func _on_Floor_body_entered(body):
	self.player_stepping = true

func _on_Floor_body_exited(body):
	self.player_stepping = false
