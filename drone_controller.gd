extends CharacterBody3D

var gravity:Vector3 = Vector3(0, -9.8, 0)
var drag:Vector3 = Vector3(0, 0, 2)

@export var liftIntensity = 25
var liftForce:Vector3 = Vector3(0, liftIntensity, 0)

@export var driveIntensity = 15
var driveForce:Vector3 = Vector3(0, 0, driveIntensity)

func _ready():
	pass
	
func _process(delta): 
	
	pass

func _physics_process(delta):
	velocity += (gravity * delta)
	
	if(Input.is_action_pressed("up")):
		velocity += (liftForce * delta)
		
	if(global_position.y > 1):
		var move = Input.get_axis("forward", "reverse")
		if(move != 0):
			velocity += (driveForce * delta * move)
			
		

	# Apply drag 
	if(velocity.z < 0):
		velocity += (delta * drag)
	elif(velocity.z > 0):
		velocity += (delta * -drag)
	
	move_and_slide()
