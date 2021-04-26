extends Item

var pillow_filename = "res://Components/Items/PillowItem.tscn" 

func _process(delta):
	var current_item = GameState.inventory.get_current_item()
	if current_item and current_item.get_filename() == pillow_filename:
		GameState.player.get_node("ProtectionAura").visible = true
	else:
		GameState.player.get_node("ProtectionAura").visible = false
