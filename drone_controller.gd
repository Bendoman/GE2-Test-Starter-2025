extends CharacterBody3D

var gravity:Vector3 = Vector3(0, -9.8, 0)

@export var liftIntensity = 25
var liftForce:Vector3 = Vector3(0, liftIntensity, 0)

func _ready():
	pass
	
func _process(delta):
	
	pass

func _physics_process(delta):
	velocity += (gravity * delta)
	
	if(Input.is_action_pressed("up")):
		velocity += (liftForce * delta)
	move_and_slide()
