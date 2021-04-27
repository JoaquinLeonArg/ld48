extends Item

func on_use():
	$Use.play()
	var target_position = GameState.camera.global_position - Vector2(1280, 720)*0.5*GameState.camera.zoom + get_global_mouse_position()*GameState.camera.zoom
	$Tween.interpolate_property(GameState.player, "position", GameState.player.position, target_position, .5, Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
	$Tween.start()
	GameState.player.disable_input = true
	GameState.player.jumping = true
	yield($Tween, "tween_completed")
	GameState.player.disable_input = false
	GameState.player.jumping = false
	if self.uses == self.max_uses - 1:
		queue_free()
