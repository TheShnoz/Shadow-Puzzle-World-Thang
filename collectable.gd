extends Sprite3D
class_name collectable
signal collected
func _ready() -> void:
	$Area3D.body_entered.connect(collect)


func collect(body):
	emit_signal('collected')
	if visible and body.name == 'Player':
		Globals.collectables_found += 1
		queue_free()
