extends Node3D

@export var MAX_SPEED = 15
var currentSpeed = 0

func _ready():
	pass

func _process(delta): 
	if(Input.is_action_pressed("up")):
		currentSpeed += .05
	elif(currentSpeed > 0): 
		currentSpeed -= .05

	rotate_y(currentSpeed)
