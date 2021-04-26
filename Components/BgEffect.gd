extends Particles2D

func _process(_delta):
	if GameState.player:
		self.position = GameState.player.position
