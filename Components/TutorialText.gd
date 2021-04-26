extends Node2D

export(String) var text = "Testing"
var shown = false

func _ready():
	$Text.bbcode_text = "[center]" + self.text + "[/center]"

func _on_Area2D_body_entered(body):
	if self.shown:
		return
	self.shown = true
	$Tween.interpolate_property($Text, "modulate:a", 0, 1, 1, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT, .2)
	$Tween.interpolate_property(self, "position:y", self.position.y, self.position.y - 8, 2, Tween.TRANS_QUAD, Tween.EASE_IN_OUT, .2)
	$Tween.start()
	$Timer.start(10)

func _on_Timer_timeout():
	queue_free()
