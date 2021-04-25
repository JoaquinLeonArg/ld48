extends Item

func on_use():
	GameState.player.global_position = GameState.camera.global_position - Vector2(1280, 720)*0.5*GameState.camera.zoom + get_global_mouse_position()*GameState.camera.zoom

func process_hold(_delta):
	$MouseHint.visible = true
	$MouseHint.global_position = get_global_mouse_position()

func process_in_inventory(_delta):
	$MouseHint.visible = false