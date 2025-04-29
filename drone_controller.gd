extends CharacterBody3D

var gravity:Vector3 = Vector3(0, -9.8, 0)
var drag:Vector3 = Vector3(0, 0, 2)

@export var liftIntensity = 25
var liftForce:Vector3 = Vector3(0, liftIntensity, 0)

@export var driveIntensity = 15
var driveForce:Vector3 = Vector3(0, 0, driveIntensity)

@export var rotationIntensity = 3
@export var tiltIntensity = 0.05
var maxTilt = 0.5

func _physics_process(delta):
	velocity += (gravity * delta)
	
	if(Input.is_action_pressed("up")):
		velocity += (liftForce * delta)
		
	var move = Input.get_axis("forward", "reverse")
	if(global_position.y > 1):
		if(move != 0):
			velocity += (global_basis.z * delta * move * driveIntensity)
			if(move < 0 and abs(global_rotation.x) < maxTilt):
				rotate(global_basis.x, -tiltIntensity)
			elif(abs(global_rotation.x) < maxTilt):
				rotate(global_basis.x, tiltIntensity)
	# Apply drag 
	if(velocity.z < 0):
		velocity += (delta * drag)
	elif(velocity.z > 0):
		velocity += (delta * -drag)
	
	if(global_position.y < 2): # Fully stop forward or reverse movement when on ground
		velocity.z = 0
		velocity.x = 0
		
	if(move == 0 and global_rotation.x != 0): 
		global_rotation.x = 0
	

	
	var rotate = Input.get_axis("right", "left")
	if(rotate != 0):
		rotate_y(rotationIntensity * delta * rotate)
	move_and_slide()
