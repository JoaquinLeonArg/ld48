extends Item

var megaphone_gfx_scene = load("res://Components/Items/GFX/MegaphoneGFX.tscn")

func on_use():
	var gfx = megaphone_gfx_scene.instance()
	gfx.position = GameState.player.position
	get_tree().root.add_child(gfx)
