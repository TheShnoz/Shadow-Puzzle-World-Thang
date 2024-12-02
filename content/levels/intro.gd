extends Node
@export var text : RichTextLabel
func _ready() -> void:
	text.visible_ratio = 0

func _process(delta: float) -> void:
	text.visible_ratio += 0.5 * delta
	if text.visible_ratio == 1:
		pass
		#this should switch to main
