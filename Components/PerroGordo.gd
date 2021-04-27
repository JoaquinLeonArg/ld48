extends KinematicBody2D

export(NodePath) var nav
onready var navigation = get_node(nav)
onready var destinations = navigation.get_node("Destinations")

var chasing
var motion
var possible_destinations
var path
var Player


export var destination_threshold = 5
export var max_speed = 200
export var FOV_distance = 80
export var walk_speed = 0.5


func _ready():
	chasing = false
	$AnimationPlayer.play("Stand")
	Player = GameState.player
	randomize()
	possible_destinations = destinations.get_children()
	find_path()


func _physics_process(delta):
	if Player.position.distance_to(self.position) < FOV_distance:
		chasing = true
		chase()
	else:
		chasing = false
		navigate()


func _on_Timer_timeout():
	find_path()


func find_path():
	var new_destination = possible_destinations[randi() % possible_destinations.size() - 1]
	path = navigation.get_simple_path(position, new_destination.position, false)


func navigate():
	if not chasing:
		var distance_to_destination = position.distance_to(path[0])
		if distance_to_destination > destination_threshold:
			patrol()
		else:
			update_path()


func chase():
	var velocity = global_position.direction_to(Player.global_position)
	move_and_collide(velocity * walk_speed)


func patrol():
	look_at(path[0])
	motion = (path[0] - position).normalized() * (max_speed * walk_speed)
	move_and_slide(motion)


func update_path():
	if path.size() == 1:
		if$Timer.is_stopped():
			$Timer.start()
	else:
		path.remove(0)


func _on_Area2D_body_entered(body):
	body.knockback(self.position.direction_to(body.position), 500)
	GameState.damage += 15
