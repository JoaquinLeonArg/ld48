extends Control

var selected_slot = 1

func _ready():
	$Slot1.visible = true
	
func _process(delta):
	if Input.is_key_pressed(KEY_1) or (self.selected_slot == 2 and Input.is_action_just_released("wheel_down")):
		self.selected_slot = 1
		$Slot1.visible = true
		$Slot2.visible = false
		$Slot3.visible = false
	elif Input.is_key_pressed(KEY_2) or (self.selected_slot == 3 and Input.is_action_just_released("wheel_down")) or (self.selected_slot == 1 and Input.is_action_just_released("wheel_up")):
		self.selected_slot = 2
		$Slot1.visible = false
		$Slot2.visible = true
		$Slot3.visible = false
	elif Input.is_key_pressed(KEY_3) or (self.selected_slot == 2 and Input.is_action_just_released("wheel_up")):
		self.selected_slot = 3
		$Slot1.visible = false
		$Slot2.visible = false
		$Slot3.visible = true
