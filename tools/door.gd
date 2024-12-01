extends Area3D
class_name door
@export var destination : Marker3D
@export var doorstination : door
@export_file('*.tscn') var levelpath : String
@export var room : Node
func _ready() -> void:
	#for child in get_children():
		#if child is Marker3D:
			#destination = child
	pass
func _on_body_entered(body: Node3D) -> void:
	pass

func teleport(body):
	if destination:
		body.position = destination.position
	if levelpath:
		get_tree().root.get_node("/root/Main").loadlevel(levelpath)
	print('door used')
	if doorstination:
		body.position = doorstination.global_position
	
