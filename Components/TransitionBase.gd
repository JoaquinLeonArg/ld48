extends Sprite
class_name TransitionBase

export(String) var text
export(PackedScene) var next_scene

var ok = true

func _ready():
	$RichTextLabel.bbcode_text = "[center]" + self.text + "[/center]"
	self.modulate.a = 0

func _process(delta):
	if self.modulate.a < 0.9:
		self.modulate.a += delta*0.5
	elif self.ok:
		self.ok = false
		$Timer.start(10)


func _on_Timer_timeout():
	if self.next_scene:
		get_tree().change_scene_to(self.next_scene)
