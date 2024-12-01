extends Camera3D

@export var activeshape : Area3D
var prev : Camera3D
func _ready() -> void:
	if activeshape == null:
		if !get_children(0).is_empty():
			for child in get_children():
				if child is Area3D:
					activeshape = child
	if activeshape !=null:
		connectarea(activeshape)

func _process(delta: float) -> void:
	pass



func connectarea(area : Area3D):
	area.body_entered.connect(setactive)
	area.body_exited.connect(previous)

func setactive(body):
	if body.name == "Player":
		prev = get_viewport().get_camera_3d()
		self.make_current()
		print('hi')

func previous(_body):
	if prev:
		prev.make_current()
	print('bye')
