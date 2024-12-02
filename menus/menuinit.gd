extends Control

func _ready() -> void:
	$VBoxContainer/Newgame.button_down.connect(newgame)
	$VBoxContainer/Settings.button_down.connect(settings)
func newgame():
	get_tree().change_scene_to_file('res://content/levels/intro.tscn')
func settings():
	pass
