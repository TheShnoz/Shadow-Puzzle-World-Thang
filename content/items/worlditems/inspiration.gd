extends Area3D
class_name inspiration
@export var genome : GenomeInfo
@export var texture : Texture

func _ready() -> void:
	$Sprite3D.texture = texture
	
