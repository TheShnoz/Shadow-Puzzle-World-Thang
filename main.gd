extends Node

@export_file('*.tscn') var levelpath : String
var levelchildref : Node
var g = Globals
func get_UI():
	return $Player/PlayerUI
func _ready() -> void:
	loadlevel(levelpath)
	g.playerUI = get_UI()
	
func loadlevel(path : String):
	if path:
		var newlevel = load(path).instantiate()
		newlevel.player = $Player
		self.add_child(newlevel)
		if levelchildref:
			levelchildref.free()
		levelchildref = newlevel
		print(levelchildref)
