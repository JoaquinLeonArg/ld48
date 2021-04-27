extends TemplateCharacter

var motion = Vector2(0, 0)
var frame = 0
var active = true
var jump_ready = true
var jumping = false
var disable_input = false
var fall_timer = 0
var invulnerable = false
var speed_buff = 0

func _ready():
	GameState.player = self

func _physics_process(delta):
	update_movement()
	move_and_slide(motion)

func knockback(direction, strength):
	self.motion = direction * strength
	self.disable_input = true
	yield(get_tree().create_timer(.2), "timeout")
	self.disable_input = false

func update_movement():
	if not self.active:
		return
		
	if self.speed_buff > 0:
		self.speed_buff -= .5
	# First we want to check the mouse position and rotate the character
	look_at(get_global_mouse_position())
	
	# Then we want to check for button presses and move the character.
	if Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up") and not self.disable_input:
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED + self.speed_buff)
	elif Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down") and not self.disable_input:
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED - self.speed_buff, 0)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
	
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right") and not self.disable_input:
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED - self.speed_buff, 0)
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left") and not self.disable_input:
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED  + self.speed_buff)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
	
	if Input.is_action_just_pressed("jump") and self.jump_ready and not self.jumping and not self.disable_input:
		$JumpSound.play()
		self.jumping = true
		self.jump_ready = false
		$Tween.interpolate_property(self, "scale", Vector2(1, 1), Vector2(1.35, 1.35), .5,Tween.TRANS_QUAD, Tween.EASE_OUT)
		$Tween.start()
		yield($Tween, "tween_completed")
		if not is_instance_valid(self):
			return
		$Tween.interpolate_property(self, "scale", Vector2(1.35, 1.35), Vector2(1, 1), .5,Tween.TRANS_QUAD, Tween.EASE_IN)
		$Tween.start()
		yield($Tween, "tween_completed")
		if not is_instance_valid(self):
			return
		self.jumping = false
		yield(get_tree().create_timer(.15), "timeout")
		if not is_instance_valid(self):
			return
		self.jump_ready = true

func _process(delta):
	self.fall_timer += 1
	if self.fall_timer > 5 and not self.jumping and not GameState.restarting and not self.invulnerable:
		self.disable_input = true
		GameState.restarting = true
		GameState.camera.transition(null)
	if self.jumping:
		self.frame = 2
	elif motion.length() < 10:
		self.frame = 0
	else:
		self.frame += delta*10
	$Sprite.frame = int(self.frame) % 8
	
	self.process_flashlight()
	
func process_flashlight():
	if GameState.inventory.get_current_item() and "FLASHLIGHT" in GameState.inventory.get_current_item().item_flags():
		$FlashLight.enabled = true
	else:
		$FlashLight.enabled = false
