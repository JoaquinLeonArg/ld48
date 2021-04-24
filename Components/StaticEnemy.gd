extends Node2D

export(int) var angle_offset = 0
export(float) var turn_factor = 1
export(String, "Static", "Sine") var movement_mode = "Static"

var t: float = 0

func _ready():
	$Cone.rotation_degrees = self.angle_offset

func _process(delta):
	self.t += delta
	if self.movement_mode == "Sine":
		$Cone.rotation_degrees = self.angle_offset + 90*(sin(self.t*self.turn_factor) + 1)
