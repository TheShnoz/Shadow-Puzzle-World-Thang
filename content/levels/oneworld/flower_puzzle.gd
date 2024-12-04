extends Node3D
var flowerscene = preload('res://flower.tscn')
@export var flowercount : int = 15
@export var spawnradius : float = 30

var puzzledone : bool = false
var changedflowers : int = 0
func _ready() -> void:
	for i in flowercount:
		var x = randf_range(- (.5 *spawnradius), (.5 *spawnradius))
		var y = randf_range(- (.5 *spawnradius), (.5 *spawnradius))
		var flower = flowerscene.instantiate()
		add_child(flower)
		flower.position.x = x
		flower.position.z = y
		flower.connect('changed', _on_change)

func _on_change():
	changedflowers += 1
	if changedflowers >= flowercount:
		puzzledone = true
		print('flowers done')
