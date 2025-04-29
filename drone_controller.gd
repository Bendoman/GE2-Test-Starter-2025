extends CharacterBody3D

var gravity:Vector3 = Vector3(0, -9.8, 0)

func _ready():
	pass
	
func _process(delta):
	
	pass

func _physics_process(delta):
	velocity += gravity * delta
	
	
	
	
	move_and_slide()
	pass
