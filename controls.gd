extends Node
@onready var maze: AnimatableBody3D = $"."
const rotation_limit = 0.5
const rotation_speed = 1
var RotX: float
var RotZ: float
var snap = 1.2

func rotationLimiter() -> void:
	if maze.rotation.x > rotation_limit:
		maze.rotation.x = rotation_limit
	if maze.rotation.x < -rotation_limit:
		maze.rotation.x = -rotation_limit
	if maze.rotation.z > rotation_limit:
		maze.rotation.z = rotation_limit
	if maze.rotation.z < -rotation_limit:
		maze.rotation.z = -rotation_limit

	
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var any_key_pressed = (Input.is_action_pressed("left") or Input.is_action_pressed("right") or Input.is_action_pressed("up") or Input.is_action_pressed("down"))

	if Input.is_action_pressed("left"):
		maze.rotation.z += delta * rotation_speed
	if Input.is_action_pressed("right"):
		maze.rotation.z -= delta * rotation_speed
	if Input.is_action_pressed("up"):
		maze.rotation.x -= delta * rotation_speed
	if Input.is_action_pressed("down"):
		maze.rotation.x += delta * rotation_speed
		
	rotationLimiter()
	if not any_key_pressed:
		print("nothing is pressed")
		maze.rotation.x /= snap
		maze.rotation.z /= snap
		if abs(maze.rotation.x) < 0.01:
			maze.rotation.x = 0
		if abs(maze.rotation.z) < 0.01:
			maze.rotation.z = 0
	else:
		print("something is pressed")
	
