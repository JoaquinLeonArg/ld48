extends Area2D

var clickable = false


func _on_Door_body_entered(body):
	if body.collision_layer == 4:
		clickable = true
	else:
		open()


func _on_Door_body_exited(body):
	if body.collision_layer == 4:
		clickable = false


func _on_Door_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and clickable:
		print("pressed!")
		open()


func open():
	$AnimationPlayer.play("Open")
