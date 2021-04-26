extends Particles2D

func _process(_delta):
	self.position = GameState.player.position
