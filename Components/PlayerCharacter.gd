extends TemplateCharacter

var motion = Vector2(0, 0)
<<<<<<< Updated upstream
=======
var frame = 0
var active = true
var jump_ready = true
var jumping = false

func _ready():
	GameState.player = self
>>>>>>> Stashed changes

func _physics_process(delta):
	update_movement()
	move_and_slide(motion)
	

func update_movement():
	# First we want to check the mouse position and rotate the character
	look_at(get_global_mouse_position())
	
	# Then we want to check for button presses and move the character.
	if Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED)
	elif Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)
	
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0)
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
<<<<<<< Updated upstream
=======
		
	if Input.is_action_just_pressed("ui_accept") and self.jump_ready and not self.jumping:
		self.jumping = true
		self.jump_ready = false
		$Tween.interpolate_property(self, "scale", Vector2(1, 1), Vector2(1.3, 1.3), .4,Tween.TRANS_QUAD, Tween.EASE_OUT)
		$Tween.start()
		yield($Tween, "tween_completed")
		$Tween.interpolate_property(self, "scale", Vector2(1.3, 1.3), Vector2(1, 1), .4,Tween.TRANS_QUAD, Tween.EASE_IN)
		$Tween.start()
		yield($Tween, "tween_completed")
		self.jumping = false
		yield(get_tree().create_timer(.1), "timeout")
		self.jump_ready = true

func _process(delta):
	if self.jumping:
		self.frame = 2
	elif motion.length() < 10:
		self.frame = 0
	else:
		self.frame += delta*10
	$Sprite.frame = int(self.frame) % 8
		
>>>>>>> Stashed changes
