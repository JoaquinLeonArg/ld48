extends Area2D

func _on_Spikes_body_entered(area):
	if area.jumping:
		return
	area.knockback(self.position.direction_to(area.position), 600)
