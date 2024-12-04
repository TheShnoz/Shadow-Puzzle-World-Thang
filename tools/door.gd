extends Area3D
class_name door
@export var destination : Marker3D
func _ready() -> void:
	#for child in get_children():
		#if child is Marker3D:
			#destination = child
	connect('body_entered', teleport)

func teleport(body):
	if destination:
		body.position = destination.global_position
