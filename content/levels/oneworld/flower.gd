extends Sprite3D
signal changed
func _ready() -> void:
	$Area3D.connect("body_entered", change)

func change(body):
	if body.name == 'Player':
		if body.getgenome().Genome_name == "Flower":
			if frame == 0:
				emit_signal('changed')
			frame = 1
