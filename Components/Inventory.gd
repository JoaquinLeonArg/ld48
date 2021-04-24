extends Control

onready var slots = {
	1: $Slot1,
	2: $Slot2,
	3: $Slot3
}
var selected_slot = 1

func _ready():
	$Slot1.self_modulate.a = 1
	$Slot2.self_modulate.a = 0
	$Slot3.self_modulate.a = 0
	
func _process(delta):
	
	
	if Input.is_key_pressed(KEY_1) or (self.selected_slot == 2 and Input.is_action_just_released("wheel_down")):
		self.selected_slot = 1
		$Slot1.self_modulate.a = 1
		$Slot2.self_modulate.a = 0
		$Slot3.self_modulate.a = 0
	elif Input.is_key_pressed(KEY_2) or (self.selected_slot == 3 and Input.is_action_just_released("wheel_down")) or (self.selected_slot == 1 and Input.is_action_just_released("wheel_up")):
		self.selected_slot = 2
		$Slot1.self_modulate.a = 0
		$Slot2.self_modulate.a = 1
		$Slot3.self_modulate.a = 0
	elif Input.is_key_pressed(KEY_3) or (self.selected_slot == 2 and Input.is_action_just_released("wheel_up")):
		self.selected_slot = 3
		$Slot1.self_modulate.a = 0
		$Slot2.self_modulate.a = 0
		$Slot3.self_modulate.a = 1

	if Input.is_action_just_pressed("ui_accept") and self.slots[self.selected_slot].get_child_count() == 1:
		self.slots[self.selected_slot].get_child(0).on_use()
		self.slots[self.selected_slot].get_child(0).process_durability()
