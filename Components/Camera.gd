extends Camera2D

export(float, 1, 10) var camera_speed = 5
export(int, 50, 200) var camera_distance = 100

export(NodePath) var tracked_object

var target_offset = Vector2.ZERO
var current_offset = Vector2.ZERO
var transitioning = false
var next_level = null

func _ready():
	GameState.camera = self
	$Tween.interpolate_property($Fade, "modulate:a", 1, 0, 2, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	$Tween.start()

func _process(delta):
	self.target_offset = get_viewport().get_mouse_position() / get_viewport().size - Vector2(0.5, 0.5)
	self.current_offset = self.current_offset.move_toward(self.target_offset, delta*camera_speed*current_offset.distance_squared_to(target_offset))
	if self.tracked_object:
		self.position = get_node(self.tracked_object).position + self.current_offset*camera_distance

func transition(next_level):
	self.next_level = next_level
	if self.transitioning:
		return
	self.transitioning = true
	$Fade.modulate.a = 1
	if self.next_level:
		get_tree().change_scene(self.next_level)
	else:
		GameState.restart()

