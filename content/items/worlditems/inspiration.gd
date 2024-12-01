extends Area3D
class_name inspiration
@export var genome : GenomeInfo
@export var texture : Texture

func _ready() -> void:
	var tex = Sprite3D.new()
	if texture:
		tex.texture = texture
	tex.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	add_child(tex)
	tex.position = self.position
	
