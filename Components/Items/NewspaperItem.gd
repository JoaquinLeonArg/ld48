extends Item

var knockback = Vector2.ZERO
var click_distance = Vector2(2, 2)
var target = null

func _physics_process(delta):
	if target:
		knockback = knockback.move_toward((target.position - GameState.player.position), 2000 * delta)
		target.move_and_collide(knockback)

func on_use():
	for enemy in GameState.enemies:
		if enemy.get_local_mouse_position().abs() < click_distance:
			target = enemy
		else:
			target = null

