extends Node
@onready var maze: RigidBody3D = $"."
var rotation_limit = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#func _input(event):
	#if event.is_action_pressed("left"):
		#maze.rotatex(10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		maze.rotate_z(0.02)
	elif Input.is_action_pressed("right"):
		maze.rotate_z(-0.02)
	elif Input.is_action_pressed("up"):
		maze.rotate_x(-0.02)
	elif Input.is_action_pressed("down"):
		maze.rotate_x(0.02)
	else:
		maze.rotation /= Vector3(1.1,1.1,1.1)
		if maze.rotation<=Vector3(0.001, 0.001, 0.001):
			maze.rotation = Vector3(0,0,0)
		
	print(maze.rotation_degrees.x,"", maze.rotation_degrees.z)
	if maze.rotation.x > rotation_limit:
		maze.rotation.x = rotation_limit
	if maze.rotation.x < -rotation_limit:
		maze.rotation.x = -rotation_limit
	if maze.rotation.z > rotation_limit:
		maze.rotation.z = rotation_limit
	if maze.rotation.z < -rotation_limit:
		maze.rotation.z = -rotation_limit
		
