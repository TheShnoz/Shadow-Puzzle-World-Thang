extends Area3D
class_name camcheck
@export var camera : Camera3D

func _ready() -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	print('cam')
	if body.name == 'Player':
		camera.current = true
