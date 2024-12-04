extends Node3D


func _ready() -> void:
	$Collectable.collected.connect(opengate)
	
func opengate():
	$Gate.queue_free()
