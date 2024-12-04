extends StaticBody3D

@export var player : CharacterBody3D

func _process(_delta: float) -> void:
	if player.getgenome().Genome_name == "Fluff" or player.getgenome().Genome_name == "bird":
		$CollisionShape3D.disabled = false
	else:
		$CollisionShape3D.disabled = true
