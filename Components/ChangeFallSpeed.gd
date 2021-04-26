extends Node2D

export(float) var fall_speed = 99999

func _on_Area2D_body_entered(body):
	GameState.fall_speed = self.fall_speed
	queue_free()
