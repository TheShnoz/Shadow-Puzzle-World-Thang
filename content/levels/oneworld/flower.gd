extends Sprite3D
signal changed
func _ready() -> void:
	$Area3D.connect("area_entered", change)

func change(_area):
	if frame == 0:
		emit_signal('changed')
	frame = 1
