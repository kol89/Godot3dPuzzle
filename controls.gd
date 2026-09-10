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
	var any_key_pressed = false

	if Input.is_action_pressed("left"):
		maze.rotation.z += delta * rotation_speed
		any_key_pressed = true
	if Input.is_action_pressed("right"):
		maze.rotation.z -= delta * rotation_speed
		any_key_pressed = true
	if Input.is_action_pressed("up"):
		maze.rotation.x -= delta * rotation_speed
		any_key_pressed = true
	if Input.is_action_pressed("down"):
		maze.rotation.x += delta * rotation_speed
		any_key_pressed = true
	if not any_key_pressed:
		maze.rotation.x /= snap
		maze.rotation.z /= snap
		if abs(maze.rotation.x) < 0.0001:
			maze.rotation.x = 0
		if abs(maze.rotation.z) < 0.0001:
			maze.rotation.z = 0
	rotationLimiter()
	
