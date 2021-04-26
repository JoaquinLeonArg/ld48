extends StaticBody2D

export(Texture) var texture

func _ready():
	if self.texture:
		$Sprite.texture = self.texture
