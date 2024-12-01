extends Camera3D

@export var target : CharacterBody3D

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	if target:
		position.x = target.position.x
		position.y = target.position.y + 5
		position.z = target.position.z + 5
		look_at(target.position)
