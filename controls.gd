extends Node
@onready var maze: RigidBody3D = $"."
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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_key_input(event):
	if !event.is_pressed(): 
		RotX = 0
		RotZ = 0
		print(snap)
		maze.rotation.x /= snap
		maze.rotation.z /= snap
		if maze.rotation<=Vector3(0.0001, 0.0001, 0.0001) and maze.rotation>=Vector3(-0.0001, -0.0001, -0.0001):
			maze.rotation = Vector3(0,0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		maze.rotation += get_process_delta_time() * Vector3(0,0,rotation_speed)
	if Input.is_action_pressed("right"):
		maze.rotation += get_process_delta_time() * Vector3(0,0,-rotation_speed)
	if Input.is_action_pressed("up"):
		maze.rotation += get_process_delta_time() * Vector3(-rotation_speed,0,0)
	if Input.is_action_pressed("down"):
		maze.rotation += get_process_delta_time() * Vector3(rotation_speed,0,0)
	print(maze.rotation_degrees.x,"", maze.rotation_degrees.z)
	rotationLimiter()
	
