extends Node3D

@export var MAX_SPEED = 10
var currentSpeed = 0

func _ready():
	pass

func _process(delta): 


	rotate_y(currentSpeed)
