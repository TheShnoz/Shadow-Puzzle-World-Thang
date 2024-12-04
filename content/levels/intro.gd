extends Node
@export var text : RichTextLabel
@export var main_scene:PackedScene
func _ready() -> void:
	text.visible_ratio = 0

func _process(delta: float) -> void:
	text.visible_ratio += 0.1 * delta #builds the text out letter by letter
	
	if text.visible_ratio == 1: #switch scene after all the text is visible
		get_tree().change_scene_to_packed(main_scene)
