extends Camera3D

var target
var cam


# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_parent().find_child("CameraMarker", true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# transform.origin += transform.basis.z
	global_position = lerp(global_position, target.global_position, delta*7)
	look_at(target.get_parent_node_3d().global_position, Vector3.UP)
