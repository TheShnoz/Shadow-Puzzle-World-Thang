extends Area3D
#this script handles collision shit, has its own boolean that says whether or not it can interact with something

class_name Collider
@export var caninteract : bool = false
var intarea
var inspirationsound : AudioStream = load('res://content/sfx/form get.mp3')
func _process(delta: float) -> void:
	search()
signal newintarea(area: GameObject)

func search():
	for area in get_overlapping_areas():
		if area is GameObject:
			if area == intarea:
				return
			else:
				intarea = area
				caninteract = true
				emit_signal('newintarea', intarea)
		if area is inspiration:
			Globals.unlockedgenomes.append(area.genome)
			$AudioStreamPlayer.play()
			area.queue_free()
			
	caninteract = false
	intarea = null
	
func get_area():
	if intarea !=null:
		return intarea
	return null

	
