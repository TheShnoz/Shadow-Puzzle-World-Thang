extends Node
@export var text : RichTextLabel
var textfinished : bool = false:
	set(value):
		if value != textfinished:
			textfinished = value
			$Timer.start()
func _ready() -> void:
	text.visible_ratio = 0

func _process(delta: float) -> void:
	text.visible_ratio += 0.5 * delta
	if text.visible_ratio == 1:
		textfinished = true



func _on_timer_timeout() -> void:
	if textfinished:
		changescene()

func changescene():
	get_tree().change_scene_to_file('res://content/levels/oneworld/one_world.tscn')
