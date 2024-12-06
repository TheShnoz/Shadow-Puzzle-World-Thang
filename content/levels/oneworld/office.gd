extends Node3D

@export var computergo :GameObject
@export var generator : GameObject
var genon : bool = false
func _ready() -> void:
	pass
	
func spawnthingy():
	$officecollectable.visible = true
	$Cubicles/PlayerDesk/Computer/Cmptr.disabled = true


func _on_cmptr_body_entered(body: Node3D) -> void:
	if body.name == "Player" and genon == true:
		spawnthingy()
		


func _on_generator_body_entered(body: Node3D) -> void:

	if body.name == "Player":
		if body.getgenome().Genome_name == "Fluff":
			$Cubicles/PlayerDesk/Computer.set_surface_override_material(1, load("res://content/textures/custom/computerON.tres"))
			genon = true
			$generator/AudioStreamPlayer3D.play()
			Globals.speak('the office seems to come alive')
