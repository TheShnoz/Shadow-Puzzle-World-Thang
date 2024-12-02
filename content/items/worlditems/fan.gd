extends AnimatedSprite3D


var on : bool = true
@export var player : CharacterBody3D
var playerin = false
func _ready() -> void:
	playerin = false
func _process(delta: float) -> void:
	if player.getgenome().Genome_name == "Rock":
		return
	if playerin and on:
		player.position.x += 5 * delta
	else:
		pass
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == player:
		playerin = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body == player:
		playerin = false
