extends Node2D

export(int) var angle_offset = 0
export(float) var turn_factor = 1
export(String, "Static", "Sine") var movement_mode = "Static"
const FOV_TOLERANCE = 20

var t: float = 0
var Player

func _ready():
	$Cone.rotation_degrees = self.angle_offset
	Player = GameState.player



func _process(delta):
	self.t += delta
	if self.movement_mode == "Sine":
		$Cone.rotation_degrees = self.angle_offset + 90*(sin(self.t*self.turn_factor) + 1)
	
	if Player_is_in_FOV():
		self.movement_mode = "Static"
	else:
		self.movement_mode = "Sine"


func Player_is_in_FOV():
	var npc_facing_direction = Vector2(1, 0).rotated(global_rotation)
	var direction_to_PlayerCharacter = (Player.position - global_position).normalized()
	
	if abs(direction_to_PlayerCharacter.angle_to(npc_facing_direction)) < deg2rad(FOV_TOLERANCE):
		print("gotcha!")
		return true
	else:
		return false
