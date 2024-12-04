extends Area3D


@export var computer : MeshInstance3D
@export var office : Node3D
func _on_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		if body.getgenome().Genome_name == "Fluff":
			computer.get_parent().set_surface_override_material(1, load("res://content/textures/custom/computerON.tres"))
			office.genon = true
