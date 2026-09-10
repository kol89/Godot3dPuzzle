extends Node
@onready var maze: RigidBody3D = $"."

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
	if Input.is_action_pressed("right"):
		maze.rotate_z(-0.02)
	if Input.is_action_pressed("up"):
		maze.rotate_x(-0.02)
	if Input.is_action_pressed("down"):
		maze.rotate_x(0.02)
