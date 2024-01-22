extends Camera3D

var hvector: Vector2
var vvector: float
var speed: float = 0.2
var rotspeed: float = 0.01
var hrot: float
var vrot: float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	rotatecam()
	
	movement()

func movement():
	hvector = Input.get_vector("left", "right", "forward", "back").normalized()
	vvector = Input.get_axis("down", "up")
	
	position.x += hvector.x * speed
	position.z += hvector.y * speed
	position.y += vvector * speed

func rotatecam():
	
	hrot = Input.get_axis("ui_left", "ui_right")
	vrot = Input.get_axis("ui_up", "ui_down")
	
	rotation.y += -hrot * rotspeed
	global_rotation.x += vrot * rotspeed
