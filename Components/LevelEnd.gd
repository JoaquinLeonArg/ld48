extends Area2D

export(PackedScene) var next_level
var ok = false
var t = 0

func _process(delta):
	t += delta
	$Sprite.scale.x = 6 + sin(self.t)
	$Sprite.scale.y = 6 + cos(self.t)

func _on_LevelEnd_body_entered(body):
	if self.ok:
		return
	self.ok = true
	GameState.player.disable_input = true
	GameState.player.invulnerable = true
	GameState.damage = 9999
	$Tween.interpolate_property(GameState.player, "position", GameState.player.position, self.position, 4, Tween.TRANS_CUBIC, 1)
	$Tween.interpolate_property(GameState.player, "scale", GameState.player.scale, Vector2(.2, .2), 4, Tween.TRANS_CUBIC, 1)
	$Tween.start()
	yield($Tween, "tween_completed")
	GameState.change_level(self.next_level)
